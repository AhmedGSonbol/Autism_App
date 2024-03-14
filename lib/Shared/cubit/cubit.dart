

import 'package:autism/Shared/cubit/states.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppCubit extends Cubit<AppStates>
{
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) =>BlocProvider.of(context);



  void getAppData(){}


  int currentTestScreen = 0;


  bool? testQueChecked ;

  List<dynamic> testAnswers = [];

  int selectedEthnicity = -1;

  void changeEthnicity(int index)
  {
    selectedEthnicity = index;

    emit(AppChangeSelectedEthnicityState());
  }


  void checkChanged(bool val)
  {

    testQueChecked = val;

    emit(AppQuestionCheckedChangeState());
  }

  void nextTestQuestion(var val)
  {


    if(val != null)
    {
      if(testAnswers.asMap().containsKey(currentTestScreen-1))
      {

        testAnswers[currentTestScreen-1] = val;
      }
      else
      {
        testAnswers.insert(currentTestScreen - 1, val);
      }

    }

    if(val is bool)
    {
      testQueChecked = null;
    }

    currentTestScreen += 1;

    if(testAnswers.asMap().containsKey(currentTestScreen-1))
    {
      if(testAnswers[currentTestScreen-1] is bool)
      {
        testQueChecked = testAnswers[currentTestScreen-1];
      }

    }

    print(testAnswers);
    print(currentTestScreen);

    emit(AppNextQuestionState());
  }

  void previousTestQuestion()
  {

    currentTestScreen -= 1;
    if(testAnswers.asMap().containsKey(currentTestScreen-1))
    {
      if(testAnswers[currentTestScreen-1] is bool)
      {
        testQueChecked = testAnswers[currentTestScreen-1];
      }
    }


    print(testAnswers);
    print(currentTestScreen);


    emit(AppPreviousQuestionState());
  }



  ///////////////  REGISTRATION  ////////////

  int currentRegScreen = 0;

  void changeCurrentRegScreen()
  {
    if(currentRegScreen == 0)
    {
      currentRegScreen = 1;
    }else
    {
      currentRegScreen = 0;
    }
  }

}