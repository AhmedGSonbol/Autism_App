import 'package:autism/Shared/Constants/Constants.dart';
import 'package:autism/Shared/components/components.dart';
import 'package:autism/Shared/cubit/cubit.dart';
import 'package:autism/Shared/cubit/states.dart';
import 'package:autism/Shared/styles/colors.dart';
import 'package:autism/profile_Child/profile_Child_Screen.dart';
import 'package:autism/profile_Posts/profile_Posts_Screen.dart';
import 'package:autism/profile_Saves/profile_Saves_Screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Profile_Screen extends StatelessWidget {
  Profile_Screen({Key? key}) : super(key: key);


  List<Widget> screens =
  [
    Profile_Posts_Screen(),
    Profile_Child_Screen(),
    Profile_Saves_Screen()
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
            backgroundColor: Color(0xff43474E),
            title: Text('الملف الشخصي',style: TextStyle(color: fontColor),),
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
                  decoration: BoxDecoration(
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
                            icon: SizedBox(),
                            onPressed: ()
                            {

                            },),
                          Image(image: AssetImage('assets/images/Rectangle.png'),width: 100,height: 100,fit: BoxFit.cover,),
                          IconButton(
                            iconSize: 25.0,
                            padding: EdgeInsets.zero,
                            icon: Icon(Icons.edit,color: fontColor,),
                          onPressed: ()
                          {

                          },)
                        ],
                      ),

                      SizedBox(height: 10.0,),

                      //username
                      Text('أحمد سنبل',style: TextStyle(fontSize: 25.0,color: fontColor),),

                      SizedBox(height: 5.0,),

                      //location
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:
                        [
                          Text('مصر - البحيرة',style: textOnBoarding2,),
                          Icon(Icons.location_on,color: fontColor,)
                        ],
                      ),

                      SizedBox(height: 20.0,),
                    ],
                  ),
                ),

                SizedBox(height: 20.0,),

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

                      SizedBox(height: 20.0,),

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
