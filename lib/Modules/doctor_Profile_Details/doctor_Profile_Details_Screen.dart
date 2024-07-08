// ignore_for_file: deprecated_member_use, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:autism/Shared/components/components.dart';
import 'package:autism/Shared/cubit/cubit.dart';
import 'package:autism/Shared/cubit/states.dart';
import 'package:autism/Shared/styles/colors.dart';
import 'package:autism/Shared/styles/text_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:readmore/readmore.dart';

class Doctor_Profile_Details_Screen extends StatelessWidget
{
  Doctor_Profile_Details_Screen({Key? key , this.isView = false}) : super(key: key);
  bool isView;

  @override
  Widget build(BuildContext context)
  {

    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state)
      {
        AppColors colors = AppColors(context);
        var cubit = AppCubit.get(context);

        return Directionality(
          textDirection: TextDirection.rtl,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'التعريف',
                  style: Theme.of(context).textTheme.headline4?.copyWith(
                      color: colors.fontColor(), fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20,
                ),
                ReadMoreText(
                  isView == false
                      ?
                  AppCubit.get(context).userModel?.data?.about ?? '-'
                      :
                  AppCubit.get(context).viewUserModel?.data?.about ?? '-',
                    style: Theme.of(context)
                      .textTheme
                      .headline6
                      ?.copyWith(color: colors.fontColor()),
                  trimLines: 2,
                  trimLength: 300,
                  colorClickableText: Colors.grey,
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 40,
                ),
                if((isView == false && cubit.userModel?.data?.clinicAddress != null && cubit.userModel!.data!.clinicAddress!.isNotEmpty) || (isView == true && cubit.viewUserModel?.data?.clinicAddress != null && cubit.viewUserModel!.data!.clinicAddress!.isNotEmpty))
                Column(
                  children: [
                    Text(
                      'عنوان العيادة',
                      style: Theme.of(context).textTheme.headline4?.copyWith(
                          color: colors.fontColor(), fontWeight: FontWeight.bold),
                    ),
                    ///location
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children:
                      [
                         Icon(Icons.location_on,color: colors.fontColor(),),

                        SizedBox(width: 5.0,),

                        if(isView == false)
                          Text( cubit.userModel!.data!.clinicAddress!,style: onBoardingDesc,),

                        if(isView == true)
                          Text(cubit.viewUserModel!.data!.clinicAddress!,style: onBoardingDesc,),


                      ],
                    ),
                  ],
                ),





                ///reviews
                // Text(
                //   'أراء  الآخرين',
                //   style: Theme.of(context)
                //       .textTheme
                //       .headline5
                //       ?.copyWith(color: fontColor, fontWeight: FontWeight.bold),
                // ),
                // SizedBox(
                //   height: 10,
                // ),
                // Text(
                //   'تعرف على ما يقوله آولياء اﻷمور و اﻷطباء الآخرين عنك',
                //   style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                //         color: fontColor,
                //       ),
                // ),
                // SizedBox(
                //   height: 20,
                // ),
                // ListView.separated(
                //   shrinkWrap: true,
                //   physics: NeverScrollableScrollPhysics(),
                //   padding: EdgeInsets.only(bottom: 20.0),
                //   itemBuilder: (context, index) {
                //     return Directionality(
                //       textDirection: TextDirection.rtl,
                //       child: buildViewsPosts(),
                //     );
                //   },
                //   separatorBuilder: (context, index) => SizedBox(
                //     height: 10.0,
                //   ),
                //   itemCount: 5,
                // )
              ],
            ),
          ),
        );
      },
    );
  }
}
//
// Widget buildViewsPosts() => Container(
//       padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
//       decoration: BoxDecoration(
//           color: Color(0xff43474E), borderRadius: BorderRadius.circular(20)),
//       child: Column(
//         children: [
//           Row(
//             children: [
//               Image.asset('assets/images/Rectangle (7).png'),
//               SizedBox(
//                 width: 10,
//               ),
//               Text(
//                 'د. أحمد علي',
//                 style: TextStyle(color: colors.fontColor(), fontSize: 24),
//               )
//             ],
//           ),
//           SizedBox(
//             height: 20,
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               Text(
//                 'د. محمد هو إنسان خلوق و جميل',
//                 style: TextStyle(color: colors.fontColor(), fontSize: 20),
//               ),
//             ],
//           )
//         ],
//       ),
//     );
