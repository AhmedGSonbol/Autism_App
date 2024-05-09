import 'dart:io';

import 'package:autism/Models/post_Model.dart';
import 'package:autism/Models/user_Model.dart';
import 'package:autism/Shared/Constants/Constants.dart';
import 'package:autism/Shared/components/components.dart';
import 'package:autism/Shared/cubit/states.dart';
import 'package:autism/Shared/network/end_points.dart';
import 'package:autism/Shared/network/remote/dio_Helper.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  // List<Post_Model> usersPosts = [
  //   Post_Model(
  //       name: 'Ahmed sonbol',
  //       date: ' ٢ أكتوبر ٢٠٢٤',
  //       avatarImage: 'assets/images/Rectangle.png',
  //       text: 'برجاء مراعاة مريض التوحد',
  //       uId: '123',
  //       isLiked: true,
  //       isSaved: true,
  //       likesCount: 21,
  //       commentsCount: 30,
  //       savesCounts: 55,
  //       postType: 0),
  //   Post_Model(
  //       name: 'محمد خميس',
  //       date: ' 9 نوفمبر 2023',
  //       avatarImage: 'assets/images/Rectangle.png',
  //       text: 'السلام عليكم',
  //       uId: '335',
  //       isLiked: false,
  //       isSaved: false,
  //       likesCount: 1,
  //       commentsCount: 5,
  //       savesCounts: 3,
  //       postType: 0),
  //   Post_Model(
  //       name: 'احمد رمضان',
  //       date: ' 7 ابريل 2019',
  //       avatarImage: 'assets/images/Rectangle.png',
  //       text:
  //           'مرض التوحد هو اضطراب عصبي يؤثر على التواصل والسلوك الاجتماعي للأفراد المصابين به. يعتبر التوحد جزءًا من طيف اضطرابات التوحد، والتي تشمل مجموعة متنوعة من الأعراض والتحديات. يمكن أن يظهر التوحد في الطفولة المبكرة ويستمر طوال الحياة.بعض الأعراض الشائعة لمرض التوحد تشمل:عدم الاستجابة لاسم الشخص أو عدم الاستماع في بعض الأحيان.مقاومة العناق وعدم الرغبة في التمسك بالآخرين، ويبدو أنه يفضل اللعب بمفرده والانعزال في عالمه الخاص.نقص في الاتصال بالعين وعدم التعبير الوجهي.عدم القدرة على التحدث أو تأخر في الكلام، أو فقدان القدرة السابقة على القول بعض الكلمات أو الجمل.عدم القدرة على بدء محادثة أو الاستمرار فيها، أو البدء في المحادثة فقط لطلب الأشياء أو تسمية العناصر.الكلام بنغمة غير طبيعية أو إيقاع وربما استخدام صوت يشبه الغناء أو الكلام الآلي.تكرار الكلمات أو العبارات حرفيًا، ولكن دون فهم كيفية استخدامها.عدم القدرة على فهم الأسئلة أو التوجيهات البسيطة.عدم التعبير عن المشاعر أو الأحاسيس ويبدو عدم وعيه لمشاعر الآخرين.عدم القدرة على الإشارة إلى الأشياء أو إحضارها لمشاركة الاهتمام.الاقتراب بشكل غير مناسب في التفاعل الاجتماعي عن طريق التكون أو العدوانية أو التشويش.إذا كنت قلقًا بشأن تطور طفلك أو تشتبه في إصابته بمرض التوحد، يُنصح بمناقشة الموضوع مع طبيب الأطفال الخاص بك.',
  //       uId: '555',
  //       isLiked: true,
  //       isSaved: false,
  //       likesCount: 0,
  //       commentsCount: 0,
  //       savesCounts: 0,
  //       postType: 0),
  //   Post_Model(
  //       name: 'Ahmed sonbol',
  //       date: ' ٢ أكتوبر ٢٠٢٤',
  //       avatarImage: 'assets/images/Rectangle.png',
  //       text: 'برجاء مراعاة مريض التوحد',
  //       uId: '123',
  //       isLiked: true,
  //       isSaved: true,
  //       likesCount: 21,
  //       commentsCount: 30,
  //       savesCounts: 55,
  //       postType: 0),
  // ];



  void getAppData()
  {
    getUserData().then((value)
    {
      getPatientsPosts();
      getDoctorsPosts();
    });


  }

  User_Model? userModel;

  Future<void> getUserData()async
  {
    emit(LoadingGetUserDataState());

    await DioHelper.getData(
      url: PROFILE ,
      token: token,
    )!.then((value)
    {
      userModel = User_Model.fromJson(value.data);

       printFullText(userModel!.data!.image.toString());

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
      print(err.toString());
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


}
