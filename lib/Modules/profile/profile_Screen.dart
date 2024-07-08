import 'package:autism/Models/messengers_Model.dart';
import 'package:autism/Modules/chat_Details/chat_Details_Screen.dart';
import 'package:autism/Modules/doctor_Profile_Details/doctor_Profile_Details_Screen.dart';
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
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class Profile_Screen extends StatelessWidget
{
  Profile_Screen({Key? key , required this.isView}) : super(key: key);

  bool isView;

  List<Widget> patientScreens =
  [
    const Profile_Posts_Screen(),
    Profile_Child_Screen(),
    const Profile_Saves_Screen()
  ];
  List<Widget> doctorScreens =
  [
    const Profile_Posts_Screen(),
    Doctor_Profile_Details_Screen(),
    const Profile_Saves_Screen()
  ];

  @override
  Widget build(BuildContext context)
  {
    return BlocConsumer<AppCubit,AppStates>(
      listener: (context, state) {},
      builder: (context, state)
      {
        AppColors colors = AppColors(context);

        var cubit = AppCubit.get(context);
        print(isView);


        return Scaffold(
          appBar: AppBar(
            backgroundColor: colors.home_drawer_item_background(),

            title:  Text('الملف الشخصي',style: TextStyle(color: colors.fontColor()),),
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back),
              color: colors.fontColor(),
            ),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
          floatingActionButton: (()
          {
            if(isView == true && cubit.viewUserModel != null && cubit.viewUserModel!.data!.profile_status == true)
            {
              return FloatingActionButton(
                onPressed: ()
                {
                  cubit.getUserMessages(cubit.viewUserModel!.data!.id!);
                  navTo(context, Chat_Details_Screen(
                    messengerModel: MessengersData(
                      name: cubit.viewUserModel!.data!.name,
                      uId: cubit.viewUserModel!.data!.id,
                      message: '',
                      date: DateFormat('EEE, dd MMM yyyy HH:mm:ss zzz').format(DateTime.now()).toString(),
                      image: cubit.viewUserModel!.data!.image,
                    ),));
                },
                child:  Icon(
                  Icons.message,
                  color: colors.backgroundColor(),
                ),
                backgroundColor: mainColor,

              );
            }

          }()),
          body: (cubit.userModel == null && isView == false) || (cubit.viewUserModel == null && isView == true)
              ?
              const Center(
                child: CircularProgressIndicator(color: mainColor,),
              )
              :
              isView == true &&  cubit.viewUserModel != null && cubit.viewUserModel!.data!.profile_status == false
                  ?
                   Center(
                    child: Text('لا يمكن عرض الملف الشخصي الخاص بهذا المستخدم',
                      style: TextStyle(fontSize: 20.0,color: colors.fontColor()),
                    ),
                  )
                  :
          SingleChildScrollView(
            child: Column(
              children:
              [
                //User info
                Container(
                  decoration:  BoxDecoration(
                    color: colors.home_drawer_item_background(),
                    borderRadius: BorderRadius.only(bottomRight: Radius.circular(16.0),bottomLeft: Radius.circular(16.0))
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:
                      [
                        Stack(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children:
                              [
                                // IconButton(
                                //   iconSize: 25.0,
                                //   padding: EdgeInsets.zero,
                                //   icon: const SizedBox(),
                                //   onPressed: ()
                                //   {
                                //
                                //   },),
                                 Hero(
                                  tag: 'profile_image',
                                    child: CircleAvatar(backgroundImage:
                                    (()
                                    {
                                      if(isView == true)
                                      {
                                        if (cubit.viewUserModel != null)
                                        {
                                          if (cubit.viewUserModel!.data!.image != null && cubit.viewUserModel!.data!.image!.isNotEmpty)
                                          {
                                            return NetworkImage(cubit.viewUserModel!.data!.image!) as ImageProvider;
                                          } else
                                          {
                                            return AssetImage('assets/images/Rectangle.png') as ImageProvider;
                                          }
                                        }
                                        else
                                        {
                                          return AssetImage('assets/images/Rectangle.png') as ImageProvider;
                                        }
                                      }
                                      else
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
                                      }

                                    }()),
                                      radius: 70.0,
                                    )),

                              ],
                            ),
                            if(isView == false)
                              Align(
                                alignment: Alignment.topRight,
                                child: IconButton(
                                  iconSize: 25.0,
                                  padding: EdgeInsets.zero,
                                  icon:  Icon(Icons.edit,color: colors.fontColor(),),
                                  onPressed: ()
                                  {
                                    navTo(context, Profile_Edit_Screen());
                                  },),
                              )
                          ],
                        ),

                        const SizedBox(height: 10.0,),


                        //username
                        if(isView == false)
                          Text(cubit.userModel != null ? cubit.userModel!.data!.name! :'User Name',style: TextStyle(fontSize: 25.0,color: colors.fontColor()),),

                        if(isView == true)
                          Text(cubit.viewUserModel != null ? cubit.viewUserModel!.data!.name! :'User Name',style: TextStyle(fontSize: 25.0,color: colors.fontColor(),fontWeight: FontWeight.bold),),

                        const SizedBox(height: 5.0,),

                        ///location
                         Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children:
                          [
                            if(isView == false)
                              Text(cubit.userModel != null ? '${cubit.userModel!.data!.city!} - ${cubit.userModel!.data!.government!}' :'Address',style: TextStyle(fontSize: 18.0,color: colors.fontColor()),),

                            if(isView == true)
                              Text(cubit.viewUserModel != null ? '${cubit.viewUserModel!.data!.city!} - ${cubit.viewUserModel!.data!.government!}' :'Address',style: TextStyle(fontSize: 18.0,color: colors.fontColor()),),

                             Icon(Icons.location_on,color: colors.fontColor(),)
                          ],
                        ),

                        const SizedBox(height: 20.0,),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 20.0,),

                if(isView == false)
                  Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Column(

                    children:
                    [
                      //navBar
                      myNavBar(
                        context,
                        selectedIndex: cubit.currentProfileScreen,
                        text: ['منشوراتك',userType == 'patient' ?'طفلك' : 'أنت','المحفوظات'],
                        onDestinationSelected:(index)
                        {
                          cubit.changeCurrentProfileScreen(index);
                        },
                      ),

                      const SizedBox(height: 20.0,),
                      userType == 'patient'
                          ?
                      patientScreens[cubit.currentProfileScreen]
                          :
                      doctorScreens[cubit.currentProfileScreen]

                    ],
                  ),
                ),

                if(isView == true)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Column(

                      children:
                      [

                        const SizedBox(height: 20.0,),

                        cubit.viewUserModel!.data!.user_type == 'patient'
                            ?
                        Profile_Child_Screen(isView: true,)
                            :
                        Doctor_Profile_Details_Screen(isView: true,),

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
