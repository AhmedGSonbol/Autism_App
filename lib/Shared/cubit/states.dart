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

class LoadingSaveUnsavePostState extends AppStates {}

class SuccessSaveUnsavePostState extends AppStates {}

class ErrorSaveUnsavePostState extends AppStates {}

class ImagePickedSuccessState extends AppStates{}

class ImagePickedErrorState extends AppStates{}

class CancelImagePickedState extends AppStates{}

class LoadingGetPendingDoctorsState extends AppStates {}

class SuccessGetPendingDoctorsState extends AppStates {}

class ErrorGetPendingDoctorsState extends AppStates {}

class LoadingConfirmDoctorsState extends AppStates {}

class SuccessConfirmDoctorsState extends AppStates
{
  final String message;
  SuccessConfirmDoctorsState(this.message);
}

class ErrorConfirmDoctorsState extends AppStates
{
  final String message;
  ErrorConfirmDoctorsState(this.message);
}

class LoadingRejectDoctorsState extends AppStates {}

class SuccessRejectDoctorsState extends AppStates
{
  final String message;
  SuccessRejectDoctorsState(this.message);
}

class ErrorRejectDoctorsState extends AppStates
{
  final String message;
  ErrorRejectDoctorsState(this.message);
}

class LoadingGetAllAdminsState extends AppStates {}

class SuccessGetAllAdminsState extends AppStates {}

class ErrorGetAllAdminsState extends AppStates {}

class LoadingGetAllDoctorsState extends AppStates {}

class SuccessGetAllDoctorsState extends AppStates {}

class ErrorGetAllDoctorsState extends AppStates {}

class LoadingGetAllPatientsState extends AppStates {}

class SuccessGetAllPatientsState extends AppStates {}

class ErrorGetAllPatientsState extends AppStates {}

class LoadingDeleteUserState extends AppStates {}

class SuccessDeleteUserState extends AppStates
{
  String message;
  SuccessDeleteUserState(this.message);
}

class ErrorDeleteUserState extends AppStates
{
  String message;
  ErrorDeleteUserState(this.message);
}

class LoadingAddAdminState extends AppStates {}

class SuccessAddAdminState extends AppStates
{
  String message;
  SuccessAddAdminState(this.message);
}

class ErrorAddAdminState extends AppStates
{
  String message;
  ErrorAddAdminState(this.message);
}

class LoadingUpdatePatientDataState extends AppStates {}

class SuccessUpdatePatientDataState extends AppStates
{
  String message;
  SuccessUpdatePatientDataState(this.message);
}

class ErrorUpdatePatientDataState extends AppStates
{
  String message;
  ErrorUpdatePatientDataState(this.message);
}

class LoadingUpdateDoctorDataState extends AppStates {}

class SuccessUpdateDoctorDataState extends AppStates
{
  String message;
  SuccessUpdateDoctorDataState(this.message);
}

class ErrorUpdateDoctorDataState extends AppStates
{
  String message;
  ErrorUpdateDoctorDataState(this.message);
}

class LoadingUpdateAdminDataState extends AppStates {}

class SuccessUpdateAdminDataState extends AppStates
{
  String message;
  SuccessUpdateAdminDataState(this.message);
}

class ErrorUpdateAdminDataState extends AppStates
{
  String message;
  ErrorUpdateAdminDataState(this.message);
}

class LoadingGetReportedPostsState extends AppStates {}

class SuccessGetReportedPostsState extends AppStates {}

class ErrorGetReportedPostsState extends AppStates
{
  String message;
  ErrorGetReportedPostsState(this.message);
}

class LoadingConfirmReportedPostState extends AppStates {}

class SuccessConfirmReportedPostState extends AppStates
{
  String message;
  SuccessConfirmReportedPostState(this.message);
}

class ErrorConfirmReportedPostState extends AppStates
{
  String message;
  ErrorConfirmReportedPostState(this.message);
}

class LoadingRejectReportedPostState extends AppStates {}

class SuccessRejectReportedPostState extends AppStates
{
  String message;
  SuccessRejectReportedPostState(this.message);
}

class ErrorRejectReportedPostState extends AppStates
{
  String message;
  ErrorRejectReportedPostState(this.message);
}

class LoadingDeletePostState extends AppStates {}

class SuccessDeletePostState extends AppStates
{
  String message;
  SuccessDeletePostState(this.message);
}

class ErrorDeletePostState extends AppStates
{
  String message;
  ErrorDeletePostState(this.message);
}

class LoadingAddReportState extends AppStates {}

class SuccessAddReportState extends AppStates
{
  String message;
  SuccessAddReportState(this.message);
}

class ErrorAddReportState extends AppStates
{
  String message;
  ErrorAddReportState(this.message);
}

class LoadingAddPostState extends AppStates {}

class SuccessAddPostState extends AppStates
{
  String message;
  SuccessAddPostState(this.message);
}

class ErrorAddPostState extends AppStates
{
  String message;
  ErrorAddPostState(this.message);
}
