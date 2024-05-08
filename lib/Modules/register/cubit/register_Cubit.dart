
import 'dart:io';

import 'package:autism/Modules/register/cubit/register_States.dart';
import 'package:autism/Shared/network/end_points.dart';
import 'package:autism/Shared/network/local/Cach_Helper.dart';
import 'package:autism/Shared/network/remote/dio_Helper.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit() : super(RegisterInitialState());

  static RegisterCubit get(context) => BlocProvider.of(context);

  bool isPassVisible = false;

  void changePassVisibility() {
    isPassVisible = !isPassVisible;


    // emit(LoginChangePassVisibilityState());
  }


  int currentRegScreenType = 0;

  void changeCurrentRegScreenType(int index)
  {

    currentRegScreenType = index;

    emit(ChangeRegScreenState());
  }

  int currentRegScreen = 0;

  void changeCurrentRegScreen(int index) {
    currentRegScreen = index;


    emit(ChangeRegScreenState());
  }

  /// Pick Avatar Image

  File? avatarImage;

  final picker = ImagePicker();

  Future pickImage() async
  {
    final XFile? pickedImage = await picker.pickImage(
        source: ImageSource.gallery);

    if (pickedImage != null)
    {
      avatarImage = File(pickedImage.path);

      emit(ImagePickedSuccessState());
    }
    else {
      emit(ImagePickedErrorState());
    }
  }

  void cancelUploadedProfileImage() {
    avatarImage = null;

    emit(CancelImagePickedState());
  }

  /// END Pick Avatar Image


  /// Pick CV

  File? cv;

  // final picker = ImagePicker();

  Future pickCV() async
  {
    FilePickerResult? result = await FilePicker.platform.pickFiles(type: FileType.custom,allowedExtensions: ['pdf']);

    if (result != null)
    {
      cv = File(result.files.single.path!);
      emit(CVPickedSuccessState());

    } else
    {
      emit(CVPickedErrorState());
    }
  }

  void cancelUploadedCV() {
    cv = null;

    emit(CancelCVPickedState());
  }

  /// END Pick CV


  void patientRegister({
    required String name,
    required String email,
    required String phone,
    required String password,
    required String government,
    required String city ,
    required String age
  })async
  {
    emit(RegisterLoadingState());

    var formData = FormData.fromMap(
    {
      'avatar' : avatarImage == null ? '' : await MultipartFile.fromFile(avatarImage!.path),
      'name' : name,
      'email' : email,
      'phone' : phone,
      'password' : password,
      'type' : 'patient',
      'government' : government,
      'city' : city,
      'age' : age,
    });
    print(formData);

    await DioHelper.postData(
      contentType: true,
      url: REGISTER,
      data:formData,
    )!.then((value)
    {
      avatarImage = null;

      emit(RegisterSuccessState(isPatient: true));
    }).catchError((err)
    {
      if(err.response?.statusCode == 400)
      {
        emit(RegisterErrorState(err.response.data['message']));
      }
      else
      {
        // emit(RegisterErrorState(err.toString()));
        emit(RegisterErrorState('خطأ في الاتصال بالانترنت'));
      }
    });
  }

  void doctorRegister({
    required String name,
    required String email,
    required String phone,
    required String password,
    required String government,
    required String city ,

  })async
  {
    emit(RegisterLoadingState());

    var formData = FormData.fromMap(
        {
          'avatar' : avatarImage == null ? '' : await MultipartFile.fromFile(avatarImage!.path),
          'cv' : await MultipartFile.fromFile(cv!.path)  , // cannot be null here, was handled in code
          'name' : name,
          'email' : email,
          'phone' : phone,
          'password' : password,
          'type' : 'doctor',
          'government' : government,
          'city' : city,
        });


    await DioHelper.postData(
      contentType: true,
      url: REGISTER,
      data:formData,
    )!.then((value)
    {
      avatarImage = null;
      cv = null;
      emit(RegisterSuccessState(isPatient: false));
    }).catchError((err)
    {
      if(err.response?.statusCode != 400)
      {
        // emit(RegisterErrorState(err.response.data.toString()));
        emit(RegisterErrorState(err.response.data['message']));
      }
      else
      {
        // emit(RegisterErrorState(err.toString()));
        emit(RegisterErrorState('خطأ في الاتصال بالانترنت'));
      }
    });
  }


}
