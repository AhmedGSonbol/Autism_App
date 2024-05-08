import 'package:autism/Modules/profile_Child/profile_Child_Screen.dart';
import 'package:autism/Modules/profile_Edit/profile_Edit_Screen.dart';
import 'package:autism/Modules/profile_Posts/profile_Posts_Screen.dart';
import 'package:autism/Modules/profile_Saves/profile_Saves_Screen.dart';
import 'package:autism/Shared/Constants/Constants.dart';
import 'package:autism/Shared/components/components.dart';
import 'package:autism/Shared/cubit/cubit.dart';
import 'package:autism/Shared/cubit/states.dart';
import 'package:autism/Shared/styles/colors.dart';
import 'package:autism/Shared/styles/text_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Profile_Screen extends StatelessWidget {
  Profile_Screen({Key? key}) : super(key: key);


  List<Widget> screens =
  [
    const Profile_Posts_Screen(),
    Profile_Child_Screen(),
    const Profile_Saves_Screen()
  ];

  @override
  Widget build(BuildContext context)
  {
    return BlocConsumer<AppCubit,AppStates>(
      listener: (context, state) {},
      builder: (context, state)
      {

        var cubit = AppCubit.get(context);

        return Scaffold(
          backgroundColor: backgroundColor,
          appBar: AppBar(
            backgroundColor: const Color(0xff43474E),
            title: const Text('الملف الشخصي',style: TextStyle(color: fontColor),),
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back),
              color: const Color(0xffE1E2E9),
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              children:
              [
                //User info
                Container(
                  decoration: const BoxDecoration(
                    color: Color(0xff43474E),
                    borderRadius: BorderRadius.only(bottomRight: Radius.circular(16.0),bottomLeft: Radius.circular(16.0))
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:
                    [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:
                        [
                          IconButton(
                            iconSize: 25.0,
                            padding: EdgeInsets.zero,
                            icon: const SizedBox(),
                            onPressed: ()
                            {

                            },),
                           Hero(
                            tag: 'profile_image',
                              child: CircleAvatar(backgroundImage:
                              (()
                              {
                                if (cubit.userModel != null)
                                {
                                  if (cubit.userModel!.data!.image != null && cubit.userModel!.data!.image!.isNotEmpty)
                                  {
                                    return NetworkImage(cubit.userModel!.data!.image!) as ImageProvider;
                                  } else
                                  {
                                    return AssetImage('assets/images/Rectangle.png') as ImageProvider;
                                  }
                                }
                                else
                                {
                                  return AssetImage('assets/images/Rectangle.png') as ImageProvider;
                                }
                              }()),
                                radius: 70.0,
                              )),
                          IconButton(
                            iconSize: 25.0,
                            padding: EdgeInsets.zero,
                            icon: const Icon(Icons.edit,color: fontColor,),
                          onPressed: ()
                          {
                            navTo(context, Profile_Edit_Screen());
                          },)
                        ],
                      ),

                      const SizedBox(height: 10.0,),

                      //username
                       Text(cubit.userModel != null ? cubit.userModel!.data!.name! :'User Name',style: TextStyle(fontSize: 25.0,color: fontColor),),

                      const SizedBox(height: 5.0,),

                      //location
                       Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:
                        [
                          Text(cubit.userModel != null ? '${cubit.userModel!.data!.city!} - ${cubit.userModel!.data!.government!}' :'Address',style: onBoardingDesc,),
                          const Icon(Icons.location_on,color: fontColor,)
                        ],
                      ),

                      const SizedBox(height: 20.0,),
                    ],
                  ),
                ),

                const SizedBox(height: 20.0,),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Column(

                    children:
                    [
                      //navBar
                      myNavBar(
                        selectedIndex: cubit.currentProfileScreen,
                        text: ['منشوراتك','طفلك','المحفوظات'],
                        onDestinationSelected:(index)
                        {
                          cubit.changeCurrentProfileScreen(index);
                        },
                      ),

                      const SizedBox(height: 20.0,),

                      screens[cubit.currentProfileScreen]
                    ],
                  ),
                )


              ],
            ),
          ),
        );

      },
    );
  }
}
