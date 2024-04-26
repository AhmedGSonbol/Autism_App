import 'package:autism/Models/post_Model.dart';
import 'package:autism/Shared/cubit/states.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  List<Post_Model> usersPosts = [
    Post_Model(
        name: 'Ahmed sonbol',
        date: ' ٢ أكتوبر ٢٠٢٤',
        avatarImage: 'assets/images/Rectangle.png',
        text: 'برجاء مراعاة مريض التوحد',
        uId: '123',
        isLiked: true,
        isSaved: true,
        likesCount: 21,
        commentsCount: 30,
        savesCounts: 55,
        postType: 0),
    Post_Model(
        name: 'محمد خميس',
        date: ' 9 نوفمبر 2023',
        avatarImage: 'assets/images/Rectangle.png',
        text: 'السلام عليكم',
        uId: '335',
        isLiked: false,
        isSaved: false,
        likesCount: 1,
        commentsCount: 5,
        savesCounts: 3,
        postType: 0),
    Post_Model(
        name: 'احمد رمضان',
        date: ' 7 ابريل 2019',
        avatarImage: 'assets/images/Rectangle.png',
        text:
            'مرض التوحد هو اضطراب عصبي يؤثر على التواصل والسلوك الاجتماعي للأفراد المصابين به. يعتبر التوحد جزءًا من طيف اضطرابات التوحد، والتي تشمل مجموعة متنوعة من الأعراض والتحديات. يمكن أن يظهر التوحد في الطفولة المبكرة ويستمر طوال الحياة.بعض الأعراض الشائعة لمرض التوحد تشمل:عدم الاستجابة لاسم الشخص أو عدم الاستماع في بعض الأحيان.مقاومة العناق وعدم الرغبة في التمسك بالآخرين، ويبدو أنه يفضل اللعب بمفرده والانعزال في عالمه الخاص.نقص في الاتصال بالعين وعدم التعبير الوجهي.عدم القدرة على التحدث أو تأخر في الكلام، أو فقدان القدرة السابقة على القول بعض الكلمات أو الجمل.عدم القدرة على بدء محادثة أو الاستمرار فيها، أو البدء في المحادثة فقط لطلب الأشياء أو تسمية العناصر.الكلام بنغمة غير طبيعية أو إيقاع وربما استخدام صوت يشبه الغناء أو الكلام الآلي.تكرار الكلمات أو العبارات حرفيًا، ولكن دون فهم كيفية استخدامها.عدم القدرة على فهم الأسئلة أو التوجيهات البسيطة.عدم التعبير عن المشاعر أو الأحاسيس ويبدو عدم وعيه لمشاعر الآخرين.عدم القدرة على الإشارة إلى الأشياء أو إحضارها لمشاركة الاهتمام.الاقتراب بشكل غير مناسب في التفاعل الاجتماعي عن طريق التكون أو العدوانية أو التشويش.إذا كنت قلقًا بشأن تطور طفلك أو تشتبه في إصابته بمرض التوحد، يُنصح بمناقشة الموضوع مع طبيب الأطفال الخاص بك.',
        uId: '555',
        isLiked: true,
        isSaved: false,
        likesCount: 0,
        commentsCount: 0,
        savesCounts: 0,
        postType: 0),
    Post_Model(
        name: 'Ahmed sonbol',
        date: ' ٢ أكتوبر ٢٠٢٤',
        avatarImage: 'assets/images/Rectangle.png',
        text: 'برجاء مراعاة مريض التوحد',
        uId: '123',
        isLiked: true,
        isSaved: true,
        likesCount: 21,
        commentsCount: 30,
        savesCounts: 55,
        postType: 0),
  ];

  List<Post_Model> doctorsPosts = [
    Post_Model(
        name: 'أحمد سنبل',
        date: ' ٢ أكتوبر ٢٠٢٤',
        avatarImage: 'assets/images/Rectangle (5).png',
        text: 'برجاء مراعاة مريض التوحد',
        uId: '123',
        isLiked: true,
        isSaved: true,
        likesCount: 21,
        commentsCount: 30,
        savesCounts: 55,
        postType: 2),
    Post_Model(
        name: 'محمد خميس',
        date: ' 9 نوفمبر 2023',
        avatarImage: 'assets/images/Rectangle.png',
        text: 'السلام عليكم',
        uId: '335',
        isLiked: false,
        isSaved: false,
        likesCount: 1,
        commentsCount: 5,
        savesCounts: 3,
        postType: 2),
    Post_Model(
        name: 'احمد رمضان',
        date: ' 7 ابريل 2019',
        avatarImage: 'assets/images/Rectangle.png',
        text:
            'مرض التوحد هو اضطراب عصبي يؤثر على التواصل والسلوك الاجتماعي للأفراد المصابين به. يعتبر التوحد جزءًا من طيف اضطرابات التوحد، والتي تشمل مجموعة متنوعة من الأعراض والتحديات. يمكن أن يظهر التوحد في الطفولة المبكرة ويستمر طوال الحياة.بعض الأعراض الشائعة لمرض التوحد تشمل:عدم الاستجابة لاسم الشخص أو عدم الاستماع في بعض الأحيان.مقاومة العناق وعدم الرغبة في التمسك بالآخرين، ويبدو أنه يفضل اللعب بمفرده والانعزال في عالمه الخاص.نقص في الاتصال بالعين وعدم التعبير الوجهي.عدم القدرة على التحدث أو تأخر في الكلام، أو فقدان القدرة السابقة على القول بعض الكلمات أو الجمل.عدم القدرة على بدء محادثة أو الاستمرار فيها، أو البدء في المحادثة فقط لطلب الأشياء أو تسمية العناصر.الكلام بنغمة غير طبيعية أو إيقاع وربما استخدام صوت يشبه الغناء أو الكلام الآلي.تكرار الكلمات أو العبارات حرفيًا، ولكن دون فهم كيفية استخدامها.عدم القدرة على فهم الأسئلة أو التوجيهات البسيطة.عدم التعبير عن المشاعر أو الأحاسيس ويبدو عدم وعيه لمشاعر الآخرين.عدم القدرة على الإشارة إلى الأشياء أو إحضارها لمشاركة الاهتمام.الاقتراب بشكل غير مناسب في التفاعل الاجتماعي عن طريق التكون أو العدوانية أو التشويش.إذا كنت قلقًا بشأن تطور طفلك أو تشتبه في إصابته بمرض التوحد، يُنصح بمناقشة الموضوع مع طبيب الأطفال الخاص بك.',
        uId: '555',
        isLiked: true,
        isSaved: false,
        likesCount: 0,
        commentsCount: 0,
        savesCounts: 0,
        postType: 3),
    Post_Model(
        name: 'Ahmed sonbol',
        date: ' ٢ أكتوبر ٢٠٢٤',
        avatarImage: 'assets/images/Rectangle.png',
        text: 'برجاء مراعاة مريض التوحد',
        uId: '123',
        isLiked: true,
        isSaved: true,
        likesCount: 21,
        commentsCount: 30,
        savesCounts: 55,
        postType: 1),
  ];

  void getAppData() {}

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

  ///////////////  REGISTRATION  ////////////

  int currentRegScreenType = 0;

  void changeCurrentRegScreenType(int index) {
    currentRegScreenType = index;

    emit(AppChangeRegScreenState());
  }

  int currentRegScreen = 0;

  void changeCurrentRegScreen(int index) {
    currentRegScreen = index;

    emit(AppChangeRegScreenState());
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

  void changeCurrentAccountScreen(int index) {
    currentAccountsScreen = index;

    emit(AppChangeAccountsScreenState());
  }
}
