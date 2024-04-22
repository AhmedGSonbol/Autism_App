import 'package:autism/Modules/login/cubit/login_States.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitialState());

  static LoginCubit get(context) => BlocProvider.of(context);

  bool isPassVisible = false;

  void changePassVisibility() {
    isPassVisible = !isPassVisible;
    isAdmin = !isAdmin;

    emit(LoginChangePassVisibilityState());
  }

  bool isAdmin = false;
}
