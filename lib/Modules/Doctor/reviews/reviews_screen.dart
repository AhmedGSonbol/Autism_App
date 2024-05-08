// ignore_for_file: camel_case_types, file_names, deprecated_member_use, prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers

import 'package:autism/Shared/components/components.dart';
import 'package:autism/Shared/cubit/cubit.dart';
import 'package:autism/Shared/cubit/states.dart';
import 'package:autism/Shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Reviews_Screen extends StatelessWidget {
  const Reviews_Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AppCubit.get(context);
        return Directionality(
          textDirection: TextDirection.rtl,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Column(
              children: [
                Container(
                  height: 150,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Color(0xff8E9199), width: .5),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'نشر',
                        style: TextStyle(
                          color: fontColor,
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        'تحذير',
                        style: TextStyle(
                            color: Color(0xffFFB4AB),
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        'أو',
                        style: TextStyle(
                          color: fontColor,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        'معلومة',
                        style: TextStyle(
                            color: Color(0xff61FD7D),
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        'أو',
                        style: TextStyle(
                          color: fontColor,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        'سؤال',
                        style: TextStyle(
                            color: Color(0xffA8C8FF),
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 50,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.report_gmailerrorred_rounded,
                            color: Color(0xffFFB4AB),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Icon(
                            Icons.info_outline,
                            color: Color(0xff16EA9E),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Icon(
                            Icons.help_outline,
                            color: Color(0xff569CFF),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  // padding: const EdgeInsetsDirectional.symmetric(vertical: 10),
                  height: 60,
                  child: TextField(
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16)),
                        hintText: 'إكتب شئ',
                        hintStyle: const TextStyle(
                          color: Color(0xffE1E2E9),
                        ),
                        suffixIcon: IconButton(
                          icon: Transform.rotate(
                            angle: 0,
                            child: const Icon(
                              Icons.send,
                              color: fontColor,
                            ),
                          ),
                          onPressed: () {},
                        )),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: ListView.separated(
                    itemBuilder: (context, index) =>Container(),
                        // bulidPostItem(context: context, model: cubit.doctorsPosts[index]),
                    separatorBuilder: (context, index) => SizedBox(
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
