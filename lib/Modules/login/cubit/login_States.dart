import 'package:autism/Models/Login_Model.dart';

abstract class LoginStates{}

class LoginInitialState extends LoginStates{}

class LoginChangePassVisibilityState extends LoginStates{}

class LoginLoadingState extends LoginStates{}

class LoginSuccessState extends LoginStates
{
  final Login_Model model;

  LoginSuccessState(this.model);
}

class LoginErrorState extends LoginStates
{
  final String error;

  LoginErrorState(this.error);
}
