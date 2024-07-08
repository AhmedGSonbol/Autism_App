import 'package:autism/Models/user_Model.dart';
import 'package:autism/Modules/change_Password/change_Password_Screen.dart';
import 'package:autism/Shared/Constants/Constants.dart';
import 'package:autism/Shared/components/components.dart';
import 'package:autism/Shared/cubit/cubit.dart';
import 'package:autism/Shared/cubit/states.dart';
import 'package:autism/Shared/styles/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Profile_Edit_Screen extends StatelessWidget
{
  Profile_Edit_Screen({Key? key,this.isAddAdmin = false}) : super(key: key);

  bool isAddAdmin;

  var nameController = TextEditingController();
  var cityController = TextEditingController();
  var governmentController = TextEditingController();
  var phoneController = TextEditingController();
  var passwordController = TextEditingController();

  //patient
  var childNameController = TextEditingController();
  var childAgeController = TextEditingController();

  //doctor
  var clinicAddressController = TextEditingController();
  var aboutController = TextEditingController();

  //admin
  var emailController = TextEditingController();
  // var addNewPasswordController = TextEditingController();
  var confirmPassController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  // String? imgPath;

  @override
  Widget build(BuildContext context)
  {


    UserData? model = AppCubit.get(context).userModel?.data;

    if(model != null && isAddAdmin == false) {
      nameController.text = model.name ?? '';
      phoneController.text = model.phone ?? '';
      emailController.text = model.email ?? '';

      if (userType != 'admin') {
        cityController.text = model.city ?? '';
        governmentController.text = model.government ?? '';

        if (userType == 'patient') {
          childNameController.text = model.patient_name ?? '';
          childAgeController.text = model.age ?? '';
        }
        else {
          aboutController.text = model.about ?? '';
          clinicAddressController.text = model.clinicAddress ?? '';
        }
      }
      else
      {
        emailController.text == model.email ?? '';
      }
    }

    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state)
      {
        if(state is SuccessAddAdminState)
        {
          myToast(msg: state.message, state: ToastStates.SUCCESS);
          nameController.clear();
          phoneController.clear();
          emailController.clear();
          passwordController.clear();
          confirmPassController.clear();
        }
        else if(state is ErrorAddAdminState)
        {
          myToast(msg: state.message, state: ToastStates.ERROR);
        }
        else if(state is SuccessUpdateDoctorDataState)
        {
          myToast(msg: state.message, state: ToastStates.SUCCESS);
        }
        else if(state is ErrorUpdateDoctorDataState)
        {
          myToast(msg: state.message, state: ToastStates.ERROR);
        }
        else if(state is SuccessUpdateAdminDataState)
        {
          myToast(msg: state.message, state: ToastStates.SUCCESS);
        }
        else if(state is ErrorUpdateAdminDataState)
        {
          myToast(msg: state.message, state: ToastStates.ERROR);
        }
        else if(state is SuccessUpdatePatientDataState)
        {
          myToast(msg: state.message, state: ToastStates.SUCCESS);
        }
        else if(state is ErrorUpdatePatientDataState)
        {
          myToast(msg: state.message, state: ToastStates.ERROR);
        }
      },
      builder: (context, state)
      {
        AppColors colors = AppColors(context);

        var cubit = AppCubit.get(context);
        model = cubit.userModel!.data;

        return Stack(
          children:
          [
            Scaffold(
              appBar: AppBar(
                backgroundColor: colors.home_drawer_item_background(),
                title:  Text(
                  isAddAdmin == false ?
                  'تعديل الملف الشخصي'
                      :
                  'إضافة مسئول جديد',
                  style: TextStyle(color: colors.fontColor()),
                ),
                leading: IconButton(
                  onPressed: ()
                  {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back),
                  color: colors.fontColor(),
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
                            color: appRedColor

                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          defaultElevatedButton(
                            onPressed: () {
                              if (formKey.currentState!.validate())
                              {
                                if(isAddAdmin == true)
                                {
                                  cubit.addAdmin(
                                      name: nameController.text,
                                      email: emailController.text,
                                      phone: phoneController.text,
                                      password: passwordController.text,
                                  );
                                }
                                else
                                {
                                  if(userType == 'admin')
                                  {
                                    cubit.updateAdminData(
                                      name: nameController.text,
                                      phone: phoneController.text,
                                      email: emailController.text,
                                    );
                                  }
                                  else if(userType == 'patient')
                                  {
                                    cubit.updatePatientData(
                                        name: nameController.text,
                                        phone: phoneController.text,
                                        email: emailController.text,
                                        government: governmentController.text,
                                        city: cityController.text,
                                        age: childAgeController.text,
                                        patient_name: childNameController.text,
                                      // image: imgPath
                                    );

                                  }
                                  else
                                  {
                                    cubit.updateDoctorData(
                                      name: nameController.text,
                                      phone: phoneController.text,
                                      email: emailController.text,
                                      government: governmentController.text,
                                      city: cityController.text,
                                      about: aboutController.text,
                                      clinicAddress: clinicAddressController.text,
                                    );
                                  }

                                }

                              }
                            },
                            text:!isAddAdmin ? 'حفظ' : 'إضافة',
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
                      decoration:  BoxDecoration(
                          color: colors.home_drawer_item_background(),
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
                                      if(model != null && model!.image != null && model!.image!.isNotEmpty)
                                      {
                                        return NetworkImage(model!.image!);
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
                                (()
                                {
                                  if(cubit.avatarImage == null) {
                                    return IconButton(
                                      icon: const CircleAvatar(
                                        child: Icon(
                                          Icons.upload,
                                          size: 20.0,
                                        ),
                                        backgroundColor: mainColor,
                                      ),
                                      onPressed: () { //A8C8FF
                                        ///upload image
                                        cubit.pickImage();
                                        //     .then((value)
                                        // {
                                        //   if(cubit.avatarImage != null)
                                        //   {
                                        //     imgPath = cubit.avatarImage!.path;
                                        //   }
                                        // });
                                      },
                                    );
                                  }else
                                  {
                                    // if(cubit.avatarImage != null)
                                    // {
                                      return IconButton(
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
                                          ///model!.image = '';
                                          // imgPath = null;

                                          cubit.cancelUploadedProfileImage();

                                        },
                                      );
                                    // }else
                                    // {
                                    //   return IconButton(
                                    //     icon: const CircleAvatar(
                                    //       child: Icon(
                                    //         Icons.close,
                                    //         size: 20.0,
                                    //       ),
                                    //       backgroundColor: mainColor,
                                    //     ),
                                    //     onPressed: () {
                                    //       ///delete image
                                    //       cubit.cancelUploadedProfileImage();
                                    //     },
                                    //   );
                                    // }

                                  }
                                }
                                ()),

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
                              context: context,
                              controller: nameController,
                              type: TextInputType.name,
                              hint: 'الأسم',
                            validate: (value) {
                              if (value == '') {
                                return 'مطلوب*';
                              }else if(value!.length < 5)
                              {
                                return 'الأسم يجب الا يقل عن 5 حروف !';
                              }
                              return null;
                            },
                            ),
                            const SizedBox(
                              height: 20.0,
                            ),
                            defaultTextFormField(
                                context: context,
                                controller: emailController,
                                type: TextInputType.emailAddress,
                                hint: 'الإيميل',
                                validate: (value)
                                {
                                  if (value == '') {
                                    return 'مطلوب*';
                                  }else if(!value!.contains('@') || !value.contains('.') || value.length < 7)
                                  {
                                    return 'برجاء كتابة الايميل بشكل صحيح !';
                                  }
                                  return null;
                                }
                            ),
                            if(userType != 'admin')
                            const SizedBox(
                              height: 20.0,
                            ),
                            if(userType != 'admin' && isAddAdmin == false)
                              defaultTextFormField(
                                  context: context,
                                controller: cityController,
                                type: TextInputType.name,
                                hint: 'الدولة'),
                            if(userType != 'admin')
                            const SizedBox(
                              height: 20.0,
                            ),if(userType != 'admin' && isAddAdmin == false)
                            defaultTextFormField(
                                context: context,
                                controller: governmentController,
                                type: TextInputType.name,
                                hint: 'المحافظة'),
                            // if(userType != 'admin')
                            const SizedBox(
                              height: 20.0,
                            ),
                            // if(userType != 'admin' && isAddAdmin == false)
                            defaultTextFormField(
                                context: context,
                                controller: phoneController,
                                type: TextInputType.phone,
                                hint: 'الهاتف',
                                validate: (value) {
                                  if (value == '') {
                                    return 'مطلوب*';
                                  }else if (value!.length != 11) {
                                    return 'رقم الهاتف يجب ان يكون 11 رقم !';
                                  }
                                  return null;
                                }),
                            // if(userType != 'admin' && isAddAdmin == false)
                            const SizedBox(
                              height: 20.0,
                            ),
                            if(userType != 'admin')
                            userType == 'patient'
                                ?
                            defaultTextFormField(
                              context: context,
                              controller: childNameController,
                              type: TextInputType.name,
                              hint: 'اسم الطفل',
                                validate: (val){
                                  return null;
                                }
                            )
                                :
                            defaultTextFormField(
                                context: context,
                                controller: clinicAddressController,
                                type: TextInputType.name,
                                hint: 'العيادة',
                              validate: (val){
                                return null;
                              }
                            ),
                            if(userType != 'admin')
                            const SizedBox(
                              height: 20.0,
                            ),
                            if(userType != 'admin' && isAddAdmin == false)
                            userType == 'patient'
                                ?
                            defaultTextFormField(
                              context: context,
                              controller: childAgeController,
                              type: TextInputType.number,
                              hint: 'عمر الطفل'
                            )
                            :
                            defaultTextFormField(
                                context: context,
                                controller: aboutController,
                                type: TextInputType.name,
                                hint: 'التعريف',
                                validate: (val){
                                  return null;
                                },
                                maxLines: 3

                            ),

                            if(isAddAdmin == true)
                            const SizedBox(
                              height: 20.0,
                            ),

                            if(isAddAdmin == true)
                            defaultTextFormField(
                                context: context,
                                controller: passwordController,
                                type: TextInputType.name,
                                hint: 'الرقم السري',
                              validate: (value)
                              {
                                return null;

                                // if (value == '') {
                                //   return 'مطلوب*';
                                // }else if (value!.length < 6) {
                                //   return 'لا يمكن انشاء رقم سري اقل من 6 احرف او ارقام';
                                // }
                              }
                            ),
                            if(isAddAdmin == true)
                            const SizedBox(
                              height: 20,
                            ),
                            if(isAddAdmin == true)
                            defaultTextFormField(
                                context: context,
                                controller: confirmPassController,
                                type: TextInputType.text,

                                hint: 'تأكيد الرقم السري',
                                validate: (value) {
                                  if (value == '')
                                  {
                                    return 'مطلوب*';
                                  }
                                  else if(passwordController.text != value)
                                  {
                                    return 'برجاء إعادة كتابة كلمة السر بشكل صحيح !';
                                  }
                                  return null;
                                }),

                            if(isAddAdmin == false)
                              const SizedBox(
                                height: 20,
                              ),
                            if(isAddAdmin == false)
                            Row(
                             children:
                             [
                               defaultElevatedButton(
                                   text: 'تعديل',
                                   onPressed: ()
                                   {
                                     navTo(context, Change_Password_Screen());
                                   }
                               ),
                               Spacer(),

                               Text('تعديل الرقم السري',style: TextStyle(color: colors.fontColor(),fontSize: 20.0),),

                             ],

                            )


                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            if(state is LoadingAddAdminState || state is LoadingUpdatePatientDataState || state is LoadingUpdateDoctorDataState || state is LoadingUpdateAdminDataState )
              Positioned.fill(
                child: Container(
                  color: Colors.grey.withOpacity(0.2),
                  child: Center(
                    child: CircularProgressIndicator(color: mainColor,),
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}
