// ignore_for_file: prefer_const_constructors

import 'package:autism/Shared/Constants/Constants.dart';
import 'package:autism/Shared/components/components.dart';
import 'package:autism/Shared/cubit/cubit.dart';
import 'package:autism/Shared/cubit/states.dart';
import 'package:autism/Shared/styles/colors.dart';
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
          child:
          cubit.usersPostsModel == null
              ?
          Center(child: CircularProgressIndicator())
              :
          Column(
            children:
            [
              if(userType == 'doctor')
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

              if(userType == 'doctor')
                const SizedBox(
                height: 10,
              ),

              if(userType == 'doctor')
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

              if(userType == 'doctor')
                const SizedBox(
                height: 10,
              ),
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
