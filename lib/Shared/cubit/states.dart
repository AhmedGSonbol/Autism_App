import 'package:autism/Models/user_Model.dart';

abstract class AppStates {}

class AppInitialState extends AppStates {}

class AppNextQuestionState extends AppStates {}

class AppPreviousQuestionState extends AppStates {}

class AppQuestionCheckedChangeState extends AppStates {}

class AppChangeSelectedEthnicityState extends AppStates {}

class AppChangeRegScreenState extends AppStates {}

class AppChangeProfileScreenState extends AppStates {}

class AppChangePassVisibilityState extends AppStates {}

class AppChangeAccountsScreenState extends AppStates {}

class AppChangeCurrentNavBarScreenState extends AppStates {}

class LoadingGetUserDataState extends AppStates {}

class SuccessGetUserDataState extends AppStates
{
  User_Model userModel;
  SuccessGetUserDataState(this.userModel);
}

class ErrorGetUserDataState extends AppStates {}

class LoadingGetPatientPostsState extends AppStates {}

class SuccessGetPatientPostsState extends AppStates {}

class ErrorGetPatientPostsState extends AppStates {}

class LoadingGetDoctorPostsState extends AppStates {}

class SuccessGetDoctorPostsState extends AppStates {}

class ErrorGetDoctorPostsState extends AppStates {}

class LoadingLikeUnlikePostState extends AppStates {}

class SuccessLikeUnlikePostState extends AppStates {}

class ErrorLikeUnlikePostState extends AppStates {}
