

import 'package:autism/Shared/cubit/states.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppCubit extends Cubit<AppStates>
{
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) =>BlocProvider.of(context);



  void getAppData(){}


  int currentTestScreen = 0;
  List<String> testQuestions =
  [
    'تشخيص أولي مبني على الذكاء  اﻹصطناعي لقياس مدى قابلية طفلك للأصابة بالتوحد و من ثم اتخذ القرار المناسب',
    ' هل ينظر إليك طفلك عندم تنادية باسمه ؟',
    'هل سهل عليك التواصل بصرياً مع طفلك ؟',
    ' هل يميل طفلك ﻹستخدام اﻹشارة بدل الكلام ؟',
    ' هل يميل طفلك لمشاركة إهتماماته معك؟',
    ' هل يتفاعل طفلك مع ألعابة كأنها تستجيب له ؟',
    'هل يميل طفلك لتخلف أثناء الذهاب إلى مكان ما ؟',
    'إذا كنت أو شخص آخر في العائلة منزعجًا بشكل واضح، فهل تظهر على طفلك علامات عاطفية كإحتضان الشخص الغاضب لتهدئت الوضع؟',
    ' هل كلمات الطفل اﻷولى كانت واضحة ؟',
    'هل يستخدم طفلك الإيماءات البسيطة؟ (على سبيل المثال التلويح بالوداع)',
    'هل يحدق طفلك في لا شيء دون أي غرض واضح؟',
    'عمر طفلك بعدد الشهور ؟',
    'ما هو جنس طفلك ؟',
    ' هل يعاني طفلك من اليرق صعوبة النوم ؟',
    ' هل هناك أي فرد من العائلة لديه تاريخ مرضي مع إضطراب طيف التوحد ؟',
    ' ما هو عرق طفلك ؟',


  ];

  bool? testQueChecked ;

  List<dynamic> testAnswers = [];


  void checkAction(bool checkVal)
  {
    testQueChecked = checkVal;
    testAnswers.insert(currentTestScreen - 1, checkVal);
    print(testQueChecked);
    print(currentTestScreen);
    print(testAnswers);
    emit(AppQuestionCheckedChangeState());
  }

  void nextTestQuestion()
  {
    print(testAnswers);
    print(currentTestScreen);
    currentTestScreen += 1;
    try
    {
       testQueChecked = testAnswers[currentTestScreen-1];

    }catch(ex)
    {
      testQueChecked = null;
    }


    print(currentTestScreen);

    emit(AppNextQuestionState());
  }

  void previousTestQuestion()
  {
    currentTestScreen -= 1;
    print(testAnswers);
    print(currentTestScreen);
    try
    {

       testQueChecked = testAnswers[currentTestScreen-1];

    }catch(ex)
    {
      testQueChecked = null;
    }

    emit(AppPreviousQuestionState());
  }

}