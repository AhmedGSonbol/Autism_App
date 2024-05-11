import 'dart:io';

import 'package:autism/Models/admin_Users_Model.dart';
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

class AppCubit extends Cubit<AppStates>
{
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  void getAppData()
  {
    if(userType != '')
    {
      getUserData().then((value)
      {

        if(userType == 'admin')
        {
          // getPending();

        }else
        {
          getPatientsPosts();
          getDoctorsPosts();
        }


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

  void getPatientsPosts()
  {
    emit(LoadingGetPatientPostsState());

    DioHelper.getData(
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



  int currentTestScreen = 0;

  bool? testQueChecked;

  List<dynamic> testAnswers = [];

  int selectedEthnicity = -1;

  void changeEthnicity(int index) {
    selectedEthnicity = index;

    emit(AppChangeSelectedEthnicityState());
  }

  void checkChanged(bool val) {
    testQueChecked = val;

    emit(AppQuestionCheckedChangeState());
  }

  void nextTestQuestion(var val) {
    if (val != null) {
      if (testAnswers.asMap().containsKey(currentTestScreen - 1)) {
        testAnswers[currentTestScreen - 1] = val;
      } else {
        testAnswers.insert(currentTestScreen - 1, val);
      }
    }

    if (val is bool) {
      testQueChecked = null;
    }

    currentTestScreen += 1;

    if (testAnswers.asMap().containsKey(currentTestScreen - 1)) {
      if (testAnswers[currentTestScreen - 1] is bool) {
        testQueChecked = testAnswers[currentTestScreen - 1];
      }
    }

    print(testAnswers);
    print(currentTestScreen);

    emit(AppNextQuestionState());
  }

  void previousTestQuestion() {
    currentTestScreen -= 1;
    if (testAnswers.asMap().containsKey(currentTestScreen - 1)) {
      if (testAnswers[currentTestScreen - 1] is bool) {
        testQueChecked = testAnswers[currentTestScreen - 1];
      }
    }

    print(testAnswers);
    print(currentTestScreen);

    emit(AppPreviousQuestionState());
  }


  int currentProfileScreen = 0;

  void changeCurrentProfileScreen(int index) {
    currentProfileScreen = index;

    emit(AppChangeProfileScreenState());
  }

  bool isPassVisible = false;

  void changePassVisibility() {
    isPassVisible = !isPassVisible;
    isAdmin = !isAdmin;

    emit(AppChangePassVisibilityState());
  }

  bool isAdmin = true;

  int currentAccountsScreen = 0;

  void changeCurrentAccountScreen(int index)
  {
    currentAccountsScreen = index;

    emit(AppChangeAccountsScreenState());
  }

  int currentNavBarIndex = 0;

  void changeCurrentNavBarScreen(int index)
  {
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


  Future<void> deleteUser(Admin_UsersData model)async
  {


      emit(LoadingDeleteUserState());

      await DioHelper.deleteData(
        url: DELETEUSER ,
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

}
