import 'package:autism/Shared/components/components.dart';
import 'package:autism/Shared/cubit/cubit.dart';
import 'package:autism/Shared/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Doctor_Profile_Saves_Screen extends StatelessWidget {
  const Doctor_Profile_Saves_Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AppCubit.get(context);

        return ListView.separated(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          padding: EdgeInsets.only(bottom: 20.0),
          itemBuilder: (context, index) {
            return Directionality(
                textDirection: TextDirection.rtl,
                child: bulidPostItem(
                    context: context, model: cubit.usersPosts[index]));
          },
          separatorBuilder: (context, index) => SizedBox(
            height: 10.0,
          ),
          itemCount: cubit.doctorsPosts.length,
        );
      },
    );
  }
}
