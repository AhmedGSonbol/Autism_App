import 'package:autism/Modules/test/test_Screen.dart';
import 'package:autism/Shared/components/components.dart';
import 'package:autism/Shared/cubit/cubit.dart';
import 'package:autism/Shared/cubit/states.dart';
import 'package:autism/Shared/styles/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Profile_Child_Screen extends StatelessWidget {
  Profile_Child_Screen({Key? key , this.isView = false}) : super(key: key);

  bool isView;


  @override
  Widget build(BuildContext context)
  {
    return BlocConsumer<AppCubit,AppStates>(
        listener: (context, state) {},
        builder: (context, state)
        {

          var cubit = AppCubit.get(context);
          AppColors colors = AppColors(context);

          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:
            [
              Text('بيانات المريض',style: TextStyle(color: mainColor,fontSize: 25.0),),
              const SizedBox(height: 20.0,),

               Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children:
                [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children:
                    [
                      Text(isView == false ? cubit.userModel!.data!.patient_name! ?? '' : cubit.viewUserModel!.data!.patient_name! ,style: TextStyle(color: colors.fontColor(),fontSize: 20.0),),
                      SizedBox(height: 10.0,),
                      Text(isView == false ? cubit.userModel!.data!.age! ?? '' : cubit.viewUserModel!.data!.age!,style: TextStyle(color: colors.fontColor(),fontSize: 20.0),),
                    ],
                  ),
                  SizedBox(width: 10.0,),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children:
                    [
                      Text(': اسم الطفل',style: TextStyle(color: colors.fontColor(),fontSize: 20.0),),
                      SizedBox(height: 10.0,),
                      Text(': عمر الطفل',style: TextStyle(color: colors.fontColor(),fontSize: 20.0),),
                    ],
                  ),
                  SizedBox(width: 10.0,),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children:
                    [
                      Icon(Icons.badge_outlined,color: mainColor,),
                      SizedBox(height: 20.0,),
                      Icon(Icons.calendar_month_outlined,color: mainColor,),
                    ],
                  ),


                ],
              ),
              if((isView == false && cubit.userModel?.data?.test_result != null) || (isView == true && cubit.viewUserModel?.data?.test_result != null))
              Column(
                children:
                [

                  const SizedBox(height: 40.0,),
                  Text('إختبار مرض التوحد',style: TextStyle(color: mainColor,fontSize: 25.0),),
                  const SizedBox(height: 20.0,),
                  if((isView == false && cubit.userModel?.data?.test_result != null) || (isView == true && cubit.viewUserModel?.data?.test_result != null))
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children:
                      [
                        ((){

                          String result = 'بدون';
                          Color color = Colors.white;

                          if(isView == false && cubit.userModel?.data?.test_result != null)
                          {
                            if(cubit.userModel?.data?.test_result == 'yes')
                            {
                              result = 'عالي';
                              color = Color(0xffFFB4AB);
                            }
                            else
                            {
                              result = 'منخفض';
                              color = Colors.green;
                            }
                          }
                          else if(isView == true && cubit.viewUserModel?.data?.test_result != null)
                          {
                            if(cubit.viewUserModel?.data?.test_result == 'yes')
                            {
                              result = 'عالي';
                              color = Color(0xffFFB4AB);
                            }
                            else
                            {
                              result = 'منخفض';
                              color = mainColor;
                            }
                          }



                          return Text(result,style: TextStyle(color: color,fontSize: 20.0),);
                        }()),

                        SizedBox(width: 10.0,),
                        Text('إحتمال الإصابة بالتوحد',style: TextStyle(color: colors.fontColor(),fontSize: 20.0),),
                        SizedBox(width: 10.0,),
                        Icon(Icons.person_pin,color: mainColor,),
                      ],),

                ],
              ),



               if(isView == false)
                 Row(
                mainAxisAlignment: MainAxisAlignment.end,

                children:
                [
                  Text('قم بتشخيص طفلك الآن',style: TextStyle(color: colors.fontColor(),fontSize: 20.0),),
                  SizedBox(width: 10.0,),
                  Icon(Icons.badge_outlined,color: mainColor,),
                ],),



              const SizedBox(height: 10.0,),
              if(isView == false)
                defaultElevatedButton(text: 'اختبر',
                onPressed: ()
                {
                  navTo(context, const Test_Screen());
                },
              ),


              ///Images
              // const SizedBox(height: 30.0,),
              // Column(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children:
              //   [
              //     const Row(
              //       mainAxisAlignment: MainAxisAlignment.center,
              //       children:
              //       [
              //
              //         Text('صور',style: TextStyle(color: colors.fontColor(),fontSize: 25.0),),
              //         SizedBox(width: 10.0,),
              //         Icon(Icons.image_outlined,color: fontColor,),
              //       ],
              //     ),
              //     const Text('قم بإضافة بعض الصور لمساعدة الطبيب المختص',style: TextStyle(color: fontColor,fontSize: 15.0),),
              //     const SizedBox(height: 20.0,),
              //     const Row(
              //       mainAxisAlignment: MainAxisAlignment.end,
              //       children:
              //       [
              //         ClipRRect(
              //           borderRadius: BorderRadius.all(Radius.circular(7.0)),
              //
              //           child: Image(image: AssetImage('assets/images/gettyimages-1379263404-612x612 1.png'),width: 100,height: 100,fit: BoxFit.cover,),
              //         ),
              //         SizedBox(width: 10.0,),
              //         ClipRRect(
              //           borderRadius: BorderRadius.all(Radius.circular(7.0)),
              //
              //           child: Image(image: AssetImage('assets/images/gettyimages-1379263404-612x612 1.png'),width: 100,height: 100,fit: BoxFit.cover,),
              //         ),
              //         SizedBox(width: 10.0,),
              //         ClipRRect(
              //           borderRadius: BorderRadius.all(Radius.circular(7.0)),
              //
              //           child: Image(image: AssetImage('assets/images/gettyimages-1379263404-612x612 1.png'),width: 100,height: 100,fit: BoxFit.cover,),
              //         ),
              //       ],
              //     ),
              //     const SizedBox(height: 20.0,),
              //     defaultElevatedButton(text: 'إضافة',onPressed: (){}),
              //   ],
              // )

            ],
          );
        },);
  }
}
