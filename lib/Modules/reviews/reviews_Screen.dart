// ignore_for_file: prefer_const_constructors

import 'package:autism/Shared/Constants/Constants.dart';
import 'package:autism/Shared/components/components.dart';
import 'package:autism/Shared/cubit/cubit.dart';
import 'package:autism/Shared/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Reviews_Screen extends StatelessWidget {
  const Reviews_Screen({super.key});

  @override
  Widget build(BuildContext context)
  {
    return BlocConsumer<AppCubit,AppStates>(
      listener: (context, state) {},
      builder: (context, state)
      {

        var cubit = AppCubit.get(context);

        return Padding(
          padding: const EdgeInsetsDirectional.all(10.0),
          child: Column(
            children: [
              Expanded(
                child: ListView.separated(
                  itemBuilder: (context, index) => bulidPostItem(
                      context: context,
                      model: cubit.doctorsPostsModel!.postData[index]),
                  separatorBuilder: (context, index) => SizedBox(
                    height: 10,
                  ),
                  itemCount: cubit.doctorsPostsModel!.postData.length,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
