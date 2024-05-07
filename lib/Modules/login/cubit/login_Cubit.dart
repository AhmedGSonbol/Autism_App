import 'package:autism/Models/Login_Model.dart';
import 'package:autism/Modules/login/cubit/login_States.dart';
import 'package:autism/Shared/network/end_points.dart';
import 'package:autism/Shared/network/remote/dio_Helper.dart';
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


  late Login_Model login_model;

  void userLogin({required String Email , required String Password})
  {
    emit(LoginLoadingState());

    DioHelper.postData(
        url: LOGIN,
        data:
        {
          'email' : Email,
          'password' : Password
        },
    )!.then((value)
    {
      // print(value.data);
      login_model = Login_Model.fromJson(value.data);
      print(login_model.data);
      emit(LoginSuccessState(login_model));
    }).catchError((err)
    {
      if(err.response?.statusCode == 400)
      {
        emit(LoginErrorState(err.response.data['Message']));
      }
      else
      {
        emit(LoginErrorState('خطأ في الاتصال بالانترنت'));
      }
    });
  }
}
