// ignore_for_file: deprecated_member_use, camel_case_types

import 'package:autism/Shared/components/components.dart';
import 'package:autism/Shared/cubit/cubit.dart';
import 'package:autism/Shared/cubit/states.dart';
import 'package:autism/Shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Posts_Doctor_Screen extends StatelessWidget {
  const Posts_Doctor_Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) => {},
      builder: (context, state) {
        var cubit = AppCubit.get(context);
        return Directionality(
          textDirection: TextDirection.rtl,
          child: Padding(
            padding: const EdgeInsetsDirectional.all(10.0),
            child: Column(
              children:
              [

                // SizedBox(
                //   // padding: const EdgeInsetsDirectional.symmetric(vertical: 10),
                //   height: 60,
                //   child: TextField(
                //     style: const TextStyle(color: Colors.white),
                //     decoration: InputDecoration(
                //         border: OutlineInputBorder(
                //             borderRadius: BorderRadius.circular(16)),
                //         hintText: 'إكتب شئ',
                //         hintStyle: const TextStyle(
                //           color: Color(0xffE1E2E9),
                //         ),
                //         suffixIcon: IconButton(
                //           icon: Transform.rotate(
                //             angle: 0,
                //             child: const Icon(
                //               Icons.send,
                //               color: fontColor,
                //             ),
                //           ),
                //           onPressed: () {},
                //         )),
                //   ),
                // ),
                // const SizedBox(
                //   height: 10,
                // ),
                Expanded(
                  child: ListView.separated(
                    itemBuilder: (context, index) => Container(),
                        // bulidPostItem(context: context, model: cubit.doctorsPosts[index]),
                    separatorBuilder: (context, index) => const SizedBox(
                      height: 10,
                    ),
                    itemCount: 0,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
