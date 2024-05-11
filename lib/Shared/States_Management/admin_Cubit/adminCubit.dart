import 'dart:io';

import 'package:autism/Models/post_Model.dart';
import 'package:autism/Models/user_Model.dart';
import 'package:autism/Shared/Constants/Constants.dart';
import 'package:autism/Shared/States_Management/admin_Cubit/adminStates.dart';
import 'package:autism/Shared/components/components.dart';
import 'package:autism/Shared/cubit/states.dart';
import 'package:autism/Shared/network/end_points.dart';
import 'package:autism/Shared/network/remote/dio_Helper.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class AdminCubit extends Cubit<AdminStates>
{
  AdminCubit() : super(AdminInitialState());
  static AdminCubit get(context) => BlocProvider.of(context);


}
