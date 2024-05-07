import 'package:autism/Models/Login_Model.dart';

abstract class RegisterStates{}

class RegisterInitialState extends RegisterStates{}

class ChangeRegScreenState extends RegisterStates{}

class ChangeAccountsScreenState extends RegisterStates{}

class ImagePickedSuccessState extends RegisterStates{}

class ImagePickedErrorState extends RegisterStates{}

class CancelImagePickedState extends RegisterStates{}

class CVPickedSuccessState extends RegisterStates{}

class CVPickedErrorState extends RegisterStates{}

class CancelCVPickedState extends RegisterStates{}

class RegisterLoadingState extends RegisterStates{}

class RegisterSuccessState extends RegisterStates
{
  final bool isPatient;
  RegisterSuccessState({required this.isPatient});
}

class RegisterErrorState extends RegisterStates
{
  RegisterErrorState(this.error);

  final String error;
}

