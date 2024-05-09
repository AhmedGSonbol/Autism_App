import 'package:autism/Shared/Constants/Constants.dart';
import 'package:autism/Shared/components/components.dart';
import 'package:autism/Shared/cubit/cubit.dart';
import 'package:autism/Shared/cubit/states.dart';
import 'package:autism/Shared/styles/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Profile_Edit_Screen extends StatelessWidget {
  Profile_Edit_Screen({Key? key}) : super(key: key);

  var nameController = TextEditingController();
  var countryController = TextEditingController();
  var governmentController = TextEditingController();
  var phoneController = TextEditingController();
  var passwordController = TextEditingController();

  //patient
  var childNameController = TextEditingController();
  var childAgeController = TextEditingController();

  //doctor
  var clinicController = TextEditingController();
  var aboutController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state)
      {

        var cubit = AppCubit.get(context);

        return Scaffold(
          backgroundColor: backgroundColor,
          appBar: AppBar(
            backgroundColor: const Color(0xff43474E),
            title: const Text(
              'تعديل الملف الشخصي',
              style: TextStyle(color: fontColor),
            ),
            leading: IconButton(
              onPressed: ()
              {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back),
              color: fontColor,
            ),
          ),
          bottomNavigationBar: BottomAppBar(
            padding: EdgeInsets.zero,
            height: 100,
            color: Colors.transparent,
            elevation: 0,
            child: Column(
              children: [
                const Divider(
                  thickness: .5,
                  color: Colors.grey,
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      defaultElevatedButton(
                        onPressed: ()
                        {
                          Navigator.of(context).pop();
                        },
                        text: 'إلغاء',
                        color: const Color(0xffDBBCE1),
                        textColor: const Color(0xff3E2845),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      defaultElevatedButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {}
                        },
                        text: 'حفظ',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          body: SingleChildScrollView(

            padding: EdgeInsets.only(bottom: 30.0),
            child: Column(
              children: [
                //User info
                Container(
                  decoration: const BoxDecoration(
                      color: Color(0xff43474E),
                      borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(16.0),
                          bottomLeft: Radius.circular(16.0))),
                  child: Center(
                    child: Column(
                      children: [
                        Stack(
                          alignment: Alignment.bottomRight,
                          children: [
                            Hero(
                              tag: 'profile_image',
                              child: CircleAvatar(backgroundImage:
                              (()
                              {
                                if(cubit.avatarImage != null)
                                {
                                  return FileImage(cubit.avatarImage!) as ImageProvider;
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
                                radius: 100.0,
                              ),
                            ),
                            cubit.avatarImage == null
                                ?
                            IconButton(
                              icon: const CircleAvatar(
                                child: Icon(
                                  Icons.upload,
                                  size: 20.0,
                                ),
                                backgroundColor: mainColor,
                              ),
                              onPressed: ()
                              {//A8C8FF
                                ///upload image
                                cubit.pickImage();

                              },
                            )
                                :
                            IconButton(
                              icon: const CircleAvatar(
                                child: Icon(
                                  Icons.close,
                                  size: 20.0,
                                ),
                                backgroundColor: mainColor,
                              ),
                              onPressed: ()
                              {
                                ///delete image
                                cubit.cancelUploadedProfileImage();

                              },
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(
                  height: 20.0,
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Form(
                    key: formKey,
                    child: Column(
                      children:
                      [
                        defaultTextFormField(

                          controller: nameController,
                          type: TextInputType.name,
                          hint: 'الأسم',
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        defaultTextFormField(
                            controller: countryController,
                            type: TextInputType.name,
                            hint: 'الدولة'),
                        const SizedBox(
                          height: 20.0,
                        ),
                        defaultTextFormField(
                            controller: governmentController,
                            type: TextInputType.name,
                            hint: 'المحافظة'),
                        const SizedBox(
                          height: 20.0,
                        ),
                        defaultTextFormField(
                            controller: phoneController,
                            type: TextInputType.name,
                            hint: 'الهاتف'),
                        const SizedBox(
                          height: 20.0,
                        ),
                        userType == 'patient'
                            ?
                        defaultTextFormField(
                          controller: childNameController,
                          type: TextInputType.name,
                          hint: 'اسم الطفل',
                        )
                            :
                        defaultTextFormField(
                            controller: clinicController,
                            type: TextInputType.name,
                            hint: 'العيادة'
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        userType == 'patient'
                            ?
                        defaultTextFormField(
                          controller: childAgeController,
                          type: TextInputType.number,
                          hint: 'عمر الطفل',
                        )
                        :
                        defaultTextFormField(
                            controller: aboutController,
                            type: TextInputType.name,
                            hint: 'التعريف',
                            maxLines: 3

                        ),



                        // const SizedBox(
                        //   height: 20.0,
                        // ),
                        // defaultTextFormField(
                        //   controller: passwordController,
                        //   type: TextInputType.name,
                        //   isPass: !cubit.isPassVisible,
                        //   label: 'الرقم السري',
                        //   iconButton: IconButton(
                        //     onPressed: () {
                        //       cubit.changePassVisibility();
                        //     },
                        //     icon: Icon(
                        //       cubit.isPassVisible
                        //           ? Icons.visibility
                        //           : Icons.visibility_off,
                        //       color: fontColor,
                        //     ),
                        //   ),
                        // ),
                      ],
                    ),
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
