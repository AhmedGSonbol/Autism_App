import 'dart:io';

import 'package:autism/Models/admin_Users_Model.dart';
import 'package:autism/Models/comments_Model.dart';
import 'package:autism/Models/messages_Model.dart';
import 'package:autism/Models/messengers_Model.dart';
import 'package:autism/Models/pending_Doctors_Model.dart';
import 'package:autism/Models/post_Model.dart';
import 'package:autism/Models/reportedPost_Model.dart';
import 'package:autism/Models/user_Model.dart';
import 'package:autism/Shared/Constants/Constants.dart';
import 'package:autism/Shared/components/components.dart';
import 'package:autism/Shared/cubit/states.dart';
import 'package:autism/Shared/network/end_points.dart';
import 'package:autism/Shared/network/remote/dio_Helper.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import 'package:socket_io_client/socket_io_client.dart' as IO;

class AppCubit extends Cubit<AppStates>
{
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  Future<void> getAppData() async
  {
    if(userType != '')
    {
      await getUserData().then((value)
      {
        getMessengers();
        initSocket();
      });
    }



  }

  User_Model? userModel;
  User_Model? viewUserModel;

  Future<void> getUserData({int userID = 0})async
  {
    emit(LoadingGetUserDataState());
    await DioHelper.getData(
      url: PROFILE ,
      token: token,
      data: userID != 0 ? {'user_id':userID} : null
    )!.then((value)
    {
      print(value.data);

      if(userID == 0) {
        userModel = User_Model.fromJson(value.data);
      }else
      {
        viewUserModel = User_Model.fromJson(value.data);
      }

      emit(SuccessGetUserDataState(userModel!));
    }).catchError((err)
    {
      emit(ErrorGetUserDataState());
      print(err.toString());
    });
  }


  Post_Model? usersPostsModel ;
  Post_Model? doctorsPostsModel ;
  List<PostData> myPosts  = [];
  List<PostData> mySavedPosts = [];

  Future<void> getPatientsPosts()async
  {
    emit(LoadingGetPatientPostsState());

    await DioHelper.getData(
      url: PATIENTS_POSTS ,
      token: token,
    )!.then((value)
    {
      usersPostsModel = Post_Model.fromJson(value.data);

      usersPostsModel!.postData.forEach((e)
      {
        if(e.post_user_id == userModel!.data!.id)
        {
          myPosts.add(e);
        }
        if(e.isSaved == true)
        {
          mySavedPosts.add(e);
        }
      });

      emit(SuccessGetPatientPostsState());
    })
        .catchError((err)
    {
      emit(ErrorGetPatientPostsState());

      if(err.response?.statusCode == 400)
      {
       print(err.response.data['message']);
      }
      else
      {
        print(err.toString());
      }

    })
    ;

  }

  void getDoctorsPosts()
  {
    emit(LoadingGetDoctorPostsState());

    DioHelper.getData(
      url: DOCTORS_POSTS ,
      token: token,
    )!.then((value)
    {
      doctorsPostsModel = Post_Model.fromJson(value.data);

      doctorsPostsModel!.postData.forEach((e)
      {
        if(e.post_user_id == userModel!.data!.id)
        {
          myPosts.add(e);
        }
        if(e.isSaved == true)
        {
          mySavedPosts.add(e);
        }
      });

      emit(SuccessGetDoctorPostsState());
    }).catchError((err)
    {
      emit(ErrorGetDoctorPostsState());
      print(err.toString());
    });

  }


  void likeUnlikePost(PostData model)
  {
    if(model.isLiked!)
    {
      model.likes = model.likes! - 1;

    }else
    {
      model.likes = model.likes! + 1;
    }
    model.isLiked = !model.isLiked!;

    emit(LoadingLikeUnlikePostState());

    DioHelper.postData(
      url: model.isLiked! ? LIKE_POST : UNLIKE_POST,
      token: token,
      data: {'post_id':model.id}
    )!.then((value)
    {

      emit(SuccessLikeUnlikePostState());
    }).catchError((err)
    {

      if(model.isLiked!)
      {
        model.likes = model.likes! - 1;

      }else
      {
        model.likes = model.likes! + 1;
      }
      model.isLiked = !model.isLiked!;
      emit(ErrorLikeUnlikePostState());
      // print(err.response.data['message']);
      // myToast(msg: err.response.data['message'], state: ToastStates.ERROR);
    });

  }

  void saveUnsavePost(PostData model)
  {

    if(model.isSaved!)
    {
      model.saves = model.saves! - 1;
      mySavedPosts.remove(model);

    }else
    {
      model.saves = model.saves! + 1;
      mySavedPosts.add(model);
      mySavedPosts.sort((a, b) => DateFormat('EEE, dd MMM yyyy HH:mm:ss zzz').parse(b.date!).compareTo(DateFormat('EEE, dd MMM yyyy HH:mm:ss zzz').parse(a.date!)));
    }
    model.isSaved = !model.isSaved!;



    emit(LoadingSaveUnsavePostState());

    DioHelper.postData(
        url: model.isSaved! ? SAVE_POST : UNSAVE_POST,
        token: token,
        data: {'post_id':model.id}
    )!.then((value)
    {

      emit(SuccessSaveUnsavePostState());
    }).catchError((err)
    {

      if(model.isSaved!)
      {
        model.saves = model.saves! - 1;
        mySavedPosts.remove(model);
      }else
      {
        model.saves = model.saves! + 1;
        mySavedPosts.add(model);
        mySavedPosts.sort((a, b) => DateFormat('EEE, dd MMM yyyy HH:mm:ss zzz').parse(b.date!).compareTo(DateFormat('EEE, dd MMM yyyy HH:mm:ss zzz').parse(a.date!)));
      }
      model.isSaved = !model.isSaved!;
      emit(ErrorSaveUnsavePostState());
      // print(err.response.data['message']);
      // myToast(msg: err.response.data['message'], state: ToastStates.ERROR);
    });

  }

  Comments_Model? comments_model;

  Future<void> getPostComments(int postID)async
  {
    emit(LoadingGetPostCommentsState());

    await DioHelper.getData(
      url: POST_COMMENT ,
      token: token,
      data: {'post_id':postID}
    )!.then((value)
    {
      print(value.data);
      comments_model = Comments_Model.fromJson(value.data);
      comments_model!.commentsData.sort((a, b) => DateFormat('EEE, dd MMM yyyy HH:mm:ss zzz').parse(b.date!).compareTo(DateFormat('EEE, dd MMM yyyy HH:mm:ss zzz').parse(a.date!)));

      emit(SuccessGetPostCommentsState());

    }).catchError((err)
    {
      emit(ErrorGetPostCommentsState());
      print(err.toString());
      if(err.response?.statusCode == 400)
      {
        print(err.response.data['message']);
      }
      else
      {
        print(err.toString());
      }

    });

  }

  Future<void> addComment({required int postID , required String content})async
  {
    emit(LoadingAddCommentState());

    await DioHelper.postData(
        url: POST_COMMENT ,
        token: token,
        data: {'post_id':postID,'content':content}
    )!.then((value)
    {

      comments_model!.commentsData.add(
        CommentsData(
            name: userModel!.data!.name,
            date: value.data['data']['date'],
            image: userModel!.data?.image,
            content: content,
            is_my_comment: true,
            id: value.data['data']['id'],
        )
      );
      comments_model!.commentsData.sort((a, b) => DateFormat('EEE, dd MMM yyyy HH:mm:ss zzz').parse(b.date!).compareTo(DateFormat('EEE, dd MMM yyyy HH:mm:ss zzz').parse(a.date!)));

      if(currentNavBarIndex == 0)
      {
        usersPostsModel!.postData.forEach((e)
        {
          if(e.id == postID )
          {
            e.comments = e.comments! + 1;
          }
        });
      }
      else
      {
        doctorsPostsModel!.postData.forEach((e)
        {
          if(e.id == postID )
          {
            e.comments = e.comments! + 1;
          }
        });
      }

      emit(SuccessAddCommentState(value.data['message'].toString()));

    }).catchError((err)
    {
      emit(ErrorAddCommentState());
      print(err.toString());
      if(err.response?.statusCode == 400)
      {
        print(err.response.data['message']);
      }
      else
      {
        print(err.toString());
      }

    });

  }

  Future<void> deleteComment({required CommentsData model , required int postID})async
  {
    emit(LoadingDeleteCommentState());

    await DioHelper.deleteData(
        url: POST_COMMENT ,
        token: token,
        data: {'comment_id':model.id}
    )!.then((value)
    {
      comments_model!.commentsData.remove(model);

      if(currentNavBarIndex == 0)
      {
        usersPostsModel!.postData.forEach((e)
        {
          if(e.id == postID )
          {
            e.comments = e.comments! - 1;
          }
        });
      }
      else
      {
        doctorsPostsModel!.postData.forEach((e)
        {
          if(e.id == postID )
          {
            e.comments = e.comments! - 1;
          }
        });
      }


      emit(SuccessDeleteCommentState(value.data['message'].toString()));

    }).catchError((err)
    {
      emit(ErrorDeleteCommentState());

      if(err.response?.statusCode == 400)
      {
        print(err.response.data['message']);
      }
      else
      {
        print(err.toString());
      }

    });

  }



  int currentTestScreen = 0;

  bool? testQueChecked;

  List<dynamic> testScreenAnswers = [];

  List<String> ethnicityListAR = [
    'شرق أوسطي',
    'أوروبي أبيض',
    'هسباني',
    'أسود',
    'آسيوي',
    'جنوب آسيوي',
    'هنود أصليون',
    'لاتينيون',
    'مختلطون',
    'باسيفيكا',
    'آخرون',
  ];

  List<String> ethnicityListEN =  ['middle eastern','White European','Hispanic','black','asian','south asian',
      'Native Indian','Latino','mixed','Pacifica','Others'] ;

  int selectedEthnicity = -1;

  void changeEthnicity(int index) {
    selectedEthnicity = index;

    emit(AppChangeSelectedEthnicityState());
  }

  void checkChanged(bool val) {
    testQueChecked = val;

    emit(AppQuestionCheckedChangeState());
  }

  String testRadioValue = '0';

  void changeTestRadioValue(String val)
  {
    testRadioValue = val;

    emit(AppChangeTestRadioValueState());
  }



  void nextTestQuestion(var val) {

    if (val != null)
    {
      if (testScreenAnswers.asMap().containsKey(currentTestScreen - 1))
      {
        testScreenAnswers[currentTestScreen - 1] = val;
      } else
      {
        testScreenAnswers.insert(currentTestScreen - 1, val);
      }
    }

    if (val is bool) {
      testQueChecked = null;
    }

    if(val is String)
    {
      testRadioValue = '0';
    }

    currentTestScreen += 1;

    if (testScreenAnswers.asMap().containsKey(currentTestScreen - 1))
    {
      if (testScreenAnswers[currentTestScreen - 1] is bool)
      {
        testQueChecked = testScreenAnswers[currentTestScreen - 1];
      }
      else if (testScreenAnswers[currentTestScreen - 1] is String)
      {
        testRadioValue = testScreenAnswers[currentTestScreen - 1];
      }
    }

    print(testScreenAnswers);
    print(currentTestScreen);

    emit(AppNextQuestionState());
  }


  void previousTestQuestion() {
    currentTestScreen -= 1;
    if (testScreenAnswers.asMap().containsKey(currentTestScreen - 1))
    {
      if (testScreenAnswers[currentTestScreen - 1] is bool)
      {
        testQueChecked = testScreenAnswers[currentTestScreen - 1];
      }
      else if (testScreenAnswers[currentTestScreen - 1] is String)
      {
        testRadioValue = testScreenAnswers[currentTestScreen - 1];
      }
    }

    print(testScreenAnswers);
    print(currentTestScreen);

    emit(AppPreviousQuestionState());
  }

  String testRate = '';

  void performTest()
  {
    List<dynamic> testAnswers =[];
    testAnswers.addAll(testScreenAnswers);

    for(int x = 0 ; x < testAnswers.length ; x++)
    {
      if(x <= 8 )
      {

        if(int.parse(testAnswers[x]) > 2)
        {
          testAnswers[x] = 1;
        }
        else
        {
          testAnswers[x] = 0;
        }
      }
      else if( x == 9)
      {
        if(int.parse(testAnswers[x]) > 3)
        {
          testAnswers[x] = 0;
        }
        else
        {
          testAnswers[x] = 1;
        }
      }
      else if( x > 10 && x < 14)
      {
        if(testAnswers[x] == true)
        {
          testAnswers[x] = 1;
        }
        else
        {
          testAnswers[x] = 0;
        }
      }
      else if( x == 14)
      {
        // print('zzzzzzz');
        // print(ethnicityListEN[testAnswers[x]]);
        testAnswers[x] = ethnicityListEN[testAnswers[x]];

      }


    }
    print('testAnswers');
    print(testAnswers);

    testRate = '';

    emit(LoadingPerformTestState());

    DioHelper.postData(
        url: TEST,
        token: token,
        data: testAnswers
    )!.then((value)
    {
      print(value.data);

      testRate = value.data['result'];

      emit(SuccessPerformTestState());
    }).catchError((err)
    {

      emit(ErrorPerformTestState());

    });

  }

  void endTest()
  {
    testScreenAnswers.clear();
    selectedEthnicity = -1;
    testRadioValue = '0';
    testQueChecked = null;
    currentTestScreen = 0;
    testRate = '';
  }



  int currentProfileScreen = 0;

  void changeCurrentProfileScreen(int index) {
    currentProfileScreen = index;

    emit(AppChangeProfileScreenState());
  }

  bool isPassVisible = false;

  void changePassVisibility()
  {
    isPassVisible = !isPassVisible;
    isAdmin = !isAdmin;

    emit(AppChangePassVisibilityState());
  }

  bool isAdmin = true;

  int currentAccountsScreen = 0;

  void changeCurrentAccountScreen(int index)
  {
    adminSearchResults = null;
    currentAccountsScreen = index;
    emit(AppChangeAccountsScreenState());
  }

  int currentNavBarIndex = 0;

  void changeCurrentNavBarScreen(int index)
  {
    if(showAddPostStyle == true)
    {
      showAddPostStyle = false;
    }
    currentNavBarIndex = index;

    emit(AppChangeCurrentNavBarScreenState());
  }


  /// Pick Avatar Image

  File? avatarImage;

  final picker = ImagePicker();

  Future pickImage() async
  {
    final XFile? pickedImage = await picker.pickImage(
        source: ImageSource.gallery);

    if (pickedImage != null)
    {
      avatarImage = File(pickedImage.path);

      emit(ImagePickedSuccessState());
    }
    else {
      emit(ImagePickedErrorState());
    }
  }

  void cancelUploadedProfileImage() {
    avatarImage = null;

    emit(CancelImagePickedState());
  }

/// END Pick Avatar Image
///
/// ADMIN SECTION ///////////////////////

  Pending_Doctors? pendingDoctors;

  Future<void> getPending({ bool isReferesh = false})async
  {
    if(pendingDoctors == null || isReferesh == true) {
      pendingDoctors = null;
      emit(LoadingGetPendingDoctorsState());

      await DioHelper.getData(
        url: PENDING_DOCS,
        token: token,
      )!.then((value) {
        pendingDoctors = Pending_Doctors.fromJson(value.data);

        emit(SuccessGetPendingDoctorsState());
      }).catchError((err) {
        emit(ErrorGetPendingDoctorsState());
        print(err.toString());
      });
    }

  }

  void confirmDoctor(PendingData model)
  {
    emit(LoadingConfirmDoctorsState());

    DioHelper.postData(
        url: CONFIRM_DOC,
        token: token,
        data: {'doctor_id':model.id}
    )!.then((value)
    {


      emit(SuccessConfirmDoctorsState(value.data['message'].toString()));
      pendingDoctors!.pendingData.remove(model);
    }).catchError((err)
    {
      if(err.response?.statusCode == 400)
      {
        emit(ErrorConfirmDoctorsState(err.response.data['message']));
      }
      else
      {
        emit(ErrorConfirmDoctorsState('خطأ في الاتصال بالانترنت'));
      }

    });

  }

  void rejectDoctor(PendingData model)
  {
    emit(LoadingRejectDoctorsState());

    DioHelper.postData(
        url: REJECT_DOC,
        token: token,
        data: {'doctor_id':model.id}
    )!.then((value)
    {


      emit(SuccessRejectDoctorsState(value.data['message'].toString()));
      pendingDoctors!.pendingData.remove(model);
    }).catchError((err)
    {
      if(err.response?.statusCode == 400)
      {
        emit(ErrorRejectDoctorsState(err.response.data['message']));
      }
      else
      {
        emit(ErrorRejectDoctorsState('خطأ في الاتصال بالانترنت'));
      }

    });

  }

  Admin_Users_Model? allAdmins;

  Future<void> getAllAdmins({bool isReferesh = false})async
  {
    if(allAdmins == null || isReferesh == true)
    {
      allAdmins = null;
      emit(LoadingGetAllAdminsState());

      await DioHelper.getData(
        url: GETALLADMINS ,
        token: token,
      )!.then((value)
      {
        allAdmins = Admin_Users_Model.fromJson(value.data);

        emit(SuccessGetAllAdminsState());
      }).catchError((err)
      {
        emit(ErrorGetAllAdminsState());
        print(err.toString());
      });
    }


  }

  Admin_Users_Model? allPatients;

  Future<void> getAllPatients({bool isReferesh = false})async
  {
    if(allPatients == null || isReferesh == true)
    {
      allPatients = null;
      emit(LoadingGetAllPatientsState());

      await DioHelper.getData(
        url: GETALLPATIENTS ,
        token: token,
      )!.then((value)
      {
        allPatients = Admin_Users_Model.fromJson(value.data);

        emit(SuccessGetAllPatientsState());
      }).catchError((err)
      {
        emit(ErrorGetAllPatientsState());
        print(err.toString());
      });
    }


  }

  Admin_Users_Model? allDoctors;

  Future<void> getAllDoctors({bool isReferesh = false})async
  {
    if(allDoctors == null || isReferesh == true)
    {
      allDoctors = null;
      emit(LoadingGetAllDoctorsState());

      await DioHelper.getData(
        url: GETALLDOCTORS ,
        token: token,
      )!.then((value)
      {
        allDoctors = Admin_Users_Model.fromJson(value.data);

        emit(SuccessGetAllDoctorsState());
      }).catchError((err)
      {
        emit(ErrorGetAllDoctorsState());
        print(err.toString());
      });
    }


  }

  Admin_Users_Model? adminSearchResults ;

  void adminSearch(String searchTest)
  {
    adminSearchResults = null;
    adminSearchResults = Admin_Users_Model.fromJson({'data':[]});

    if(currentAccountsScreen == 0 && allAdmins!.admin_UsersData.isNotEmpty) /// admin
    {

      allAdmins!.admin_UsersData.forEach((element)
      {

        bool contain = element.name!.contains(searchTest);

        if(contain)
        {

          adminSearchResults?.admin_UsersData.add(element);
        }


      });
    }
    else if(currentAccountsScreen == 1 && allDoctors!.admin_UsersData.isNotEmpty) /// doctor
    {
      allDoctors!.admin_UsersData.forEach((element)
      {

        bool contain = element.name!.contains(searchTest);

        if(contain)
        {

          adminSearchResults?.admin_UsersData.add(element);
        }


      });
    }
    else if(currentAccountsScreen == 2 && allPatients!.admin_UsersData.isNotEmpty)/// patient
    {
      allPatients!.admin_UsersData.forEach((element)
      {

        bool contain = element.name!.contains(searchTest);
        if(contain)
        {
          adminSearchResults?.admin_UsersData.add(element);
        }
      });
    }

    emit(SearchAdminState());

  }


  Future<void> deleteUser(Admin_UsersData model)async
  {


      emit(LoadingDeleteUserState());

      await DioHelper.deleteData(
        url: DELETE_USER ,
        token: token,
        data: {'user_id':model.id},
      )!.then((value)
      {

        if(model.user_type == 'patient')
        {
          allPatients!.admin_UsersData.remove(model);
        }
        else if(model.user_type == 'doctor')
        {
          allDoctors!.admin_UsersData.remove(model);
        }
        else
        {
          allAdmins!.admin_UsersData.remove(model);
        }

        emit(SuccessDeleteUserState(value.data['message']));

      }).catchError((err)
      {

        print(err.toString());
        if(err.response?.statusCode == 400)
        {
          emit(ErrorDeleteUserState(err.response.data['message']));
          print(err.response.data);
        }
        else
        {
          emit(ErrorDeleteUserState(err.toString()));
        }
      });



  }

  Future<void> addAdmin({required String name,required String email,required String phone,required String password})async
  {
    emit(LoadingAddAdminState());

    var formData = FormData.fromMap(
        {
          'avatar' : avatarImage == null ? '' : await MultipartFile.fromFile(avatarImage!.path),
          'name' : name,
          'email' : email,
          'phone' : phone,
          'password' : password,
          'type' : 'admin',

        });

    DioHelper.postData(
        contentType: true,
        url: REGISTER,
        token: token,
        data: formData
    )!.then((value)
    {

      avatarImage = null;
      emit(SuccessAddAdminState(value.data['message'].toString()));
      // allAdmins!.admin_UsersData.add(Admin_UsersData()); id not found
      getAllAdmins(isReferesh: true);
    }).catchError((err)
    {
      if(err.response?.statusCode == 400)
      {
        emit(ErrorAddAdminState(err.response.data['message']));
      }
      else
      {
        emit(ErrorAddAdminState('خطأ في الاتصال بالانترنت'));
      }

    });

  }


  /// END ADMIN SECTION ///////////////////////


  Future<void> updatePatientData({
    required String name,
    required String phone,
    required String password,
    required String government,
    required String city,
    required String age,
    required String patient_name,
    String? image,

  })async
  {
    emit(LoadingUpdatePatientDataState());

    var formData = FormData.fromMap(
        image != null ?
        {
          'avatar' : avatarImage == null ? '' : await MultipartFile.fromFile(image),
          'name' : name,
          'phone' : phone,
          'password' : password,
          'government' : government,
          'city' : city,
          'age' : age,
          'patient_name' : patient_name,
          'type' : 'patient',

        }
        :
      {

        'name' : name,
        'phone' : phone,
        'password' : password,
        'government' : government,
        'city' : city,
        'age' : age,
        'patient_name' : patient_name,
        'type' : 'patient',

      }
        );

    DioHelper.postData(
        contentType: true,
        url: UPDATE_USER_DATA,
        token: token,
        data: formData
    )!.then((value)
    {


      getUserData().then((valuee)
      {
        avatarImage = null;
        emit(SuccessUpdatePatientDataState(value.data['message'].toString()));

      });

    }).catchError((err)
    {
      if(err.response?.statusCode == 400)
      {
        emit(ErrorUpdatePatientDataState(err.response.data['message']));
      }
      else
      {
        emit(ErrorUpdatePatientDataState('خطأ في الاتصال بالانترنت'));
      }

    });

  }

  Future<void> updateDoctorData({
    required String name,
    required String phone,
    required String password,
    required String government,
    required String city,
    required String about,
    required String clinicAddress,
    String? image,

  })async
  {
    emit(LoadingUpdateDoctorDataState());

    var formData = FormData.fromMap(
        image != null ?
        {
          'avatar' : avatarImage == null ? '' : await MultipartFile.fromFile(avatarImage!.path),
          'name' : name,
          'phone' : phone,
          'password' : password,
          'government' : government,
          'city' : city,
          'about' : about,
          'clinicAddress' : clinicAddress,
          'type' : 'doctor',

        }
        :
        {
          'name' : name,
          'phone' : phone,
          'password' : password,
          'government' : government,
          'city' : city,
          'about' : about,
          'clinicAddress' : clinicAddress,
          'type' : 'doctor',

        });

    DioHelper.postData(
        contentType: true,
        url: UPDATE_USER_DATA,
        token: token,
        data: formData
    )!.then((value)
    {

      avatarImage = null;
      getUserData();
      emit(SuccessUpdateDoctorDataState(value.data['message'].toString()));

    }).catchError((err)
    {
      if(err.response?.statusCode == 400)
      {
        emit(ErrorUpdateDoctorDataState(err.response.data['message']));
      }
      else
      {
        emit(ErrorUpdateDoctorDataState('خطأ في الاتصال بالانترنت'));
      }

    });

  }

  Future<void> updateAdminData({
    required String name,
    required String phone,
    required String password,
    String? image,
  })async
  {
    emit(LoadingUpdateAdminDataState());

    var formData = FormData.fromMap(
        image != null ?
        {
          'avatar' : avatarImage == null ? '' : await MultipartFile.fromFile(avatarImage!.path),
          'name' : name,
          'phone' : phone,
          'password' : password,
          'type' : 'admin',
        }
        :
        {
          'name' : name,
          'phone' : phone,
          'password' : password,
          'type' : 'admin',
        });

    DioHelper.postData(
        contentType: true,
        url: UPDATE_USER_DATA,
        token: token,
        data: formData
    )!.then((value)
    {

      avatarImage = null;
      getUserData();
      emit(SuccessUpdateAdminDataState(value.data['message'].toString()));
      // allAdmins!.admin_UsersData.add(Admin_UsersData()); id not found
      // getAllAdmins(isReferesh: true);
    }).catchError((err)
    {
      if(err.response?.statusCode == 400)
      {
        emit(ErrorUpdateAdminDataState(err.response.data['message']));
      }
      else
      {
        emit(ErrorUpdateAdminDataState('خطأ في الاتصال بالانترنت'));
      }

    });

  }

  Future<void> updatePassword({
    required String oldPassword,
    required String newPassword,
  })async
  {
    emit(LoadingUpdatePasswordState());

    DioHelper.postData(
        url: UPDATE_USER_PASSWORD,
        token: token,
        data: {
          "old_password":oldPassword,
          "new_password":newPassword
        }
    )!.then((value)
    {


      emit(SuccessUpdatePasswordState(value.data['message'].toString()));

    }).catchError((err)
    {
      if(err.response?.statusCode == 400)
      {
        emit(ErrorUpdatePasswordState(err.response.data['message']));
      }
      else
      {
        emit(ErrorUpdateAdminDataState('خطأ في الاتصال بالانترنت'));
      }

    });

  }


  ReportedPost_Model? reportedPosts;

  Future<void> getReportedPosts({bool isReferesh = false})async
  {
    if(reportedPosts == null || isReferesh == true)
    {
      reportedPosts = null;
      emit(LoadingGetReportedPostsState());

      await DioHelper.getData(
        url: REPORTEDPOSTS ,
        token: token,
      )!.then((value)
      {
        reportedPosts = ReportedPost_Model.fromJson(value.data);

        emit(SuccessGetReportedPostsState());
      }).catchError((err)
      {
        print(err.toString());
        if(err.response?.statusCode == 400)
        {
          emit(ErrorGetReportedPostsState(err.response.data['message']));
        }
        else
        {
          emit(ErrorGetReportedPostsState('خطأ في الاتصال بالانترنت'));
        }
      });
    }


  }

  Future<void> confirmReportedPost(ReportedPostData model)async
  {

      emit(LoadingConfirmReportedPostState());

      await DioHelper.postData(
        url: APPROVEREPORTEDPOSTS ,
        token: token,
          data: {'report_id':model.id}
      )!.then((value)
      {
        reportedPosts!.reportedPostData.remove(model);

        emit(SuccessConfirmReportedPostState(value.data['message'].toString()));
      }).catchError((err)
      {
        print(err.toString());
        if(err.response?.statusCode == 400)
        {
          emit(ErrorConfirmReportedPostState(err.response.data['message']));
        }
        else
        {
          emit(ErrorConfirmReportedPostState('خطأ في الاتصال بالانترنت'));
        }
      });



  }

  Future<void> rejectReportedPost(ReportedPostData model)async
  {

    emit(LoadingRejectReportedPostState());

    await DioHelper.deleteData(
        url: REPORTEDPOSTS ,
        token: token,
        data: {'report_id':model.id}
    )!.then((value)
    {
      reportedPosts!.reportedPostData.remove(model);

      emit(SuccessRejectReportedPostState(value.data['message'].toString()));
    }).catchError((err)
    {
      print(err.toString());
      if(err.response?.statusCode == 400)
      {
        emit(ErrorRejectReportedPostState(err.response.data['message']));
      }
      else
      {
        emit(ErrorRejectReportedPostState('خطأ في الاتصال بالانترنت'));
      }
    });



  }

  Future<void> deletePost(PostData model)async
  {

    emit(LoadingDeletePostState());

    await DioHelper.deleteData(
        url: POSTS ,
        token: token,
        data: {'post_id':model.id}
    )!.then((value)
    {
      if(userType == 'patient')
      {
        usersPostsModel!.postData.remove(model);

      }
      else
      {
        doctorsPostsModel!.postData.remove(model);
      }
      myPosts.remove(model);
      mySavedPosts.removeWhere((element) => element.post_user_id == model.post_user_id);


      emit(SuccessDeletePostState(value.data['message'].toString()));
    }).catchError((err)
    {
      print(err.toString());
      if(err.response?.statusCode == 400)
      {
        print(err.response?.data);
        emit(ErrorDeletePostState(err.response.data['message']));
      }
      else
      {
        emit(ErrorDeletePostState('خطأ في الاتصال بالانترنت'));
      }
    });



  }

  void addReport(int postID,String complaint)
  {
    emit(LoadingAddReportState());

    DioHelper.postData(
        url: REPORTEDPOSTS,
        token: token,
        data: {'post_id':postID,'user_id':userModel!.data!.id,'complaint':complaint}
    )!.then((value)
    {


      emit(SuccessAddReportState(value.data['message'].toString()));

    }).catchError((err)
    {
      if(err.response?.statusCode == 400)
      {
        emit(ErrorAddReportState(err.response.data['message']));
      }
      else
      {
        emit(ErrorAddReportState('خطأ في الاتصال بالانترنت'));
      }

    });

  }


  void addPost({required String type,required String content})
  {
    emit(LoadingAddPostState());

    DioHelper.postData(
        url: POSTS,
        token: token,
        data: {'type':type,'content':content}
    )!.then((value)
    {




      PostData insertedPost = PostData(
          id: value.data['data']['id'],
          email: userModel!.data!.email,
          name: userModel!.data!.name,
          date: value.data['data']['date'],
          image: userModel!.data!.image,
          content: content,
          post_user_id: value.data['data']['user_id'],
          isLiked: false,
          isSaved: false,
          type: value.data['data']['type'],
          likes: 0,
          comments: 0,
          saves: 0,
      );
      if(type.isEmpty)
      {
        usersPostsModel!.postData.add(insertedPost);
        usersPostsModel!.postData.sort((a, b) => DateFormat('EEE, dd MMM yyyy HH:mm:ss zzz').parse(b.date!).compareTo(DateFormat('EEE, dd MMM yyyy HH:mm:ss zzz').parse(a.date!)));
      }else
      {
        doctorsPostsModel!.postData.add(insertedPost);
        doctorsPostsModel!.postData.sort((a, b) => DateFormat('EEE, dd MMM yyyy HH:mm:ss zzz').parse(b.date!).compareTo(DateFormat('EEE, dd MMM yyyy HH:mm:ss zzz').parse(a.date!)));
      }
      myPosts.add(insertedPost);
      myPosts.sort((a, b) => DateFormat('EEE, dd MMM yyyy HH:mm:ss zzz').parse(b.date!).compareTo(DateFormat('EEE, dd MMM yyyy HH:mm:ss zzz').parse(a.date!)));

      emit(SuccessAddPostState(value.data['message'].toString()));



    }).catchError((err)
    {
      if(err.response?.statusCode == 400)
      {
        emit(ErrorAddPostState(err.response.data['message']));
      }
      else
      {
        emit(ErrorAddPostState('خطأ في الاتصال بالانترنت'));
      }

    });

  }


  bool showAddPostStyle = false;

  void changeAddPostStyle()
  {
    showAddPostStyle = !showAddPostStyle;

    emit(ChangeAddDocPostStyle());
  }

  String docPostType = 'advice';

  void changeDocPostType(String val)
  {
    docPostType = val;

    emit(ChangeDocPostType());
  }


  Messengers_Model? messengers_model;

  void getMessengers()
  {
    emit(LoadingGetMessengersState());

    DioHelper.getData(
      url: MESSENGERS ,
      token: token,
    )!.then((value)
    {

      messengers_model = Messengers_Model.fromJson(value.data);

      messengers_model!.messengersData.sort((a, b) => DateFormat('EEE, dd MMM yyyy HH:mm:ss zzz').parse(b.date!).compareTo(DateFormat('EEE, dd MMM yyyy HH:mm:ss zzz').parse(a.date!)));

      emit(SuccessGetMessengersState());

    }).catchError((err)
    {
      emit(ErrorGetMessengersState());
      print(err.toString());
    });

  }

  Messages_Model? messages_model;

  void getUserMessages(int receiver_id)
  {
    messages_model = null;

    emit(LoadingGetUserMessagesState());



    DioHelper.getData(
        url: MESSAGES ,
        token: token,
        data: {'receiver_id':receiver_id}
    )!.then((value)
    {
      print(value.data);
      messages_model = Messages_Model.fromJson(value.data);

      messages_model!.messagesData.sort((a, b) => DateFormat('EEE, dd MMM yyyy HH:mm:ss zzz').parse(a.date!).compareTo(DateFormat('EEE, dd MMM yyyy HH:mm:ss zzz').parse(b.date!)));


      emit(SuccessGetUserMessagesState());

    }).catchError((err)
    {
      emit(ErrorGetUserMessagesState());
      print(err.toString());
    });

  }

  IO.Socket? socket;

  initSocket()
  {
    print('iniiiiiitiallll sockett');
    socket = IO.io('https://a9f0-197-63-235-225.ngrok-free.app/',
        IO.OptionBuilder()
            .setTransports(['websocket']) // for Flutter or Dart VM
            .disableAutoConnect()  // disable auto-connection
            .setExtraHeaders({'foo': 'bar'}) // optional
            .build()
    );

    socket!.connect();
    socket!.onConnect((data) => print('connected to the server !!'));

    socket!.emit('addUserToSocket',userModel!.data!.id!);

    socket!.on('response', (data)
    {
      // print(data.toString());
      print("bring messageeeeeeeeeeeeeeeeeeeeeeeeeeee");
      if(data['status'] == true)
      {
        messages_model!.messagesData.add(
            MessagesData(date: DateFormat('EEE, dd MMM yyyy HH:mm:ss zzz').format(DateTime.now()), message: data['message'].toString(), isMyMessage: data['isMyMessage'], status: true)
        );

        emit(SuccessGetNewMessagesState());
      }
      else
      {

        messages_model!.messagesData.add(
            MessagesData(date: DateFormat('EEE, dd MMM yyyy HH:mm:ss zzz').format(DateTime.now()) , message: 'فشل إرسال الرسالة !!', isMyMessage: true, status: false)
        );

        emit(ErrorGetNewMessagesState());
      }
      messages_model!.messagesData.sort((a, b) => DateFormat('EEE, dd MMM yyyy HH:mm:ss zzz').parse(a.date!).compareTo(DateFormat('EEE, dd MMM yyyy HH:mm:ss zzz').parse(b.date!)));
    }
    );

    // socketEventsHandler(socket!);

  }

  // socketEventsHandler(IO.Socket socket)
  // {
  //   socket.onConnect((data) => print('connected to the server !!'));
  //
  //
  //
  // }

  sendMessage(String message , MessengersData messengersData)
  {

    socket!.emit('sendMessage',
        {
          'myID':userModel!.data!.id,
          'receiverID':messengersData.uId,
          'message':message
        });

    messengersData.message = message;
    messengersData.date = DateFormat('EEE, dd MMM yyyy HH:mm:ss zzz').format(DateTime.now());

    if(messengers_model == null || messengers_model!.messengersData.isEmpty)
    {
      messengers_model!.messengersData.add(messengersData);
    }
    else
    {
      bool isExist = false;
      messengers_model!.messengersData.forEach((element)
      {
        if(element.uId == messengersData.uId)
        {
          element.message = messengersData.message;
          element.date = messengersData.date;
          isExist = true;
        }
      });

      if(isExist == false)
      {
        messengers_model!.messengersData.add(messengersData);
      }

    }
    messages_model!.messagesData.sort((a, b) => DateFormat('EEE, dd MMM yyyy HH:mm:ss zzz').parse(b.date!).compareTo(DateFormat('EEE, dd MMM yyyy HH:mm:ss zzz').parse(a.date!)));
  }


}
