import 'package:autism/Models/user_Model.dart';

abstract class AdminStates {}

class AdminInitialState extends AdminStates {}

class AppNextQuestionState extends AdminStates {}

class AppPreviousQuestionState extends AdminStates {}

class AppQuestionCheckedChangeState extends AdminStates {}

class AppChangeSelectedEthnicityState extends AdminStates {}

class AppChangeRegScreenState extends AdminStates {}

class AppChangeProfileScreenState extends AdminStates {}

class AppChangePassVisibilityState extends AdminStates {}

class AppChangeAccountsScreenState extends AdminStates {}

class AppChangeCurrentNavBarScreenState extends AdminStates {}

class LoadingGetUserDataState extends AdminStates {}

class SuccessGetUserDataState extends AdminStates
{
  User_Model userModel;
  SuccessGetUserDataState(this.userModel);
}

class ErrorGetUserDataState extends AdminStates {}

class LoadingGetPatientPostsState extends AdminStates {}

class SuccessGetPatientPostsState extends AdminStates {}

class ErrorGetPatientPostsState extends AdminStates {}

class LoadingGetDoctorPostsState extends AdminStates {}

class SuccessGetDoctorPostsState extends AdminStates {}

class ErrorGetDoctorPostsState extends AdminStates {}

class LoadingLikeUnlikePostState extends AdminStates {}

class SuccessLikeUnlikePostState extends AdminStates {}

class ErrorLikeUnlikePostState extends AdminStates {}

class LoadingSaveUnsavePostState extends AdminStates {}

class SuccessSaveUnsavePostState extends AdminStates {}

class ErrorSaveUnsavePostState extends AdminStates {}

class ImagePickedSuccessState extends AdminStates{}

class ImagePickedErrorState extends AdminStates{}

class CancelImagePickedState extends AdminStates{}
