// ignore_for_file: sort_child_properties_last, non_constant_identifier_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_interpolation_to_compose_strings, unnecessary_const

import 'package:autism/Shared/components/components.dart';
import 'package:autism/Shared/cubit/cubit.dart';
import 'package:autism/Shared/cubit/states.dart';
import 'package:autism/Shared/styles/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jiffy/jiffy.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class Test_Screen extends StatelessWidget {
  const Test_Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var dateController = TextEditingController();

    List<String> ethnicityList = [
      'شرق أوسطي',
      'أوروبي أبيض',
      'هسباني',
      'أسود',
      'آسيوي',
      'جنوب آسيوي',
      'هنود أصليون',
      'لاتينيون',
      'مختلطون',
      'باسيفيكا',
      'آخرون',
    ];

    List<String> testQuestions = [
      'تشخيص أولي مبني على الذكاء  اﻹصطناعي لقياس مدى قابلية طفلك للأصابة بالتوحد و من ثم اتخذ القرار المناسب',
      ' هل ينظر إليك طفلك عندم تنادية باسمه ؟',
      'هل سهل عليك التواصل بصرياً مع طفلك ؟',
      ' هل يميل طفلك ﻹستخدام اﻹشارة بدل الكلام ؟',
      ' هل يميل طفلك لمشاركة إهتماماته معك؟',
      ' هل يتفاعل طفلك مع ألعابة كأنها تستجيب له ؟',
      'هل يميل طفلك لتخلف أثناء الذهاب إلى مكان ما ؟',
      'إذا كنت أو شخص آخر في العائلة منزعجًا بشكل واضح، فهل تظهر على طفلك علامات عاطفية كإحتضان الشخص الغاضب لتهدئت الوضع؟',
      ' هل كلمات الطفل اﻷولى كانت واضحة ؟',
      'هل يستخدم طفلك الإيماءات البسيطة؟ (على سبيل المثال التلويح بالوداع)',
      'هل يحدق طفلك في لا شيء دون أي غرض واضح؟',
      'ما هو تاريخ الميلاد ؟',
      'ما هو جنس طفلك ؟',
      ' هل يعاني طفلك من اليرق صعوبة النوم ؟',
      ' هل هناك أي فرد من العائلة لديه تاريخ مرضي مع إضطراب طيف التوحد ؟',
      ' ما هو عرق طفلك ؟',
    ];

    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AppCubit.get(context);

        return Scaffold(
          backgroundColor: backgroundColor,
          appBar: AppBar(
            backgroundColor: backgroundColor,
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back),
              color: fontColor,
            ),
            title: const Text(
              'التشخيص',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                fontFamily: 'Roboto',
                color: fontColor,
              ),
            ),
          ),
          bottomNavigationBar: BottomAppBar(
            padding: EdgeInsets.zero,
            height: 100,
            color: Colors.transparent,
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
                      if (cubit.currentTestScreen != 0)
                        defaultElevatedButton(
                          onPressed: () {
                            cubit.previousTestQuestion();
                          },
                          text: 'السابق',
                          color: const Color(0xffDBBCE1),
                          textColor: const Color(0xff3E2845),
                        ),
                      const SizedBox(
                        width: 15,
                      ),
                      defaultElevatedButton(
                        onPressed: () {
                          if (cubit.currentTestScreen == 0) {
                            cubit.nextTestQuestion(null);
                          } else {
                            if (cubit.currentTestScreen != 11 &&
                                cubit.currentTestScreen != 15) {
                              if (cubit.testQueChecked != null) {
                                cubit.nextTestQuestion(cubit.testQueChecked);
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content:
                                            Text('برجاء اختيار إجابة اولاً')));
                              }
                            } else if (cubit.currentTestScreen == 11) {
                              if (dateController.text.isNotEmpty) {
                                int x = Jiffy.now()
                                    .diff(Jiffy.parse(dateController.text),
                                        unit: Unit.month)
                                    .toInt();

                                if (x >= 0) {
                                  cubit.nextTestQuestion(x);
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content: Text(
                                              'برجاء اختيار تاريخ صحيح !')));
                                }
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text(
                                            'برجاء اختيار تاريخ الميلاد اولاً')));
                              }
                            } else {
                              if (cubit.selectedEthnicity >= 0) {
                                cubit.nextTestQuestion(cubit.selectedEthnicity);
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content:
                                            Text('برجاء اختيار إجابة اولاً')));
                              }
                            }
                          }
                        },
                        text: 'التالي',
                      ),
                    ],
                  ),
                ),
              ],
            ),
            elevation: 0,
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                children: [
                  if (cubit.currentTestScreen != 0)
                    Align(
                      alignment: Alignment.centerLeft,
                      child: CircularStepProgressIndicator(
                        totalSteps: 15,
                        currentStep: cubit.currentTestScreen - 1,
                        stepSize: 6,
                        selectedColor: Color(0xffA8C8FF),
                        unselectedColor: Color(0xff254777),
                        padding: 0,
                        width: 50,
                        height: 50,
                        selectedStepSize: 6,
                        roundedCap: (_, __) => true,
                      ),
                    ),

                  SizedBox(
                    height: 20.0,
                  ),

                  Center(
                    child: Image(
                      //      assets/images/test_images/test0.png
                      image: AssetImage(
                          'assets/images/test_images/test${cubit.currentTestScreen}.png'),
                      fit: BoxFit.cover,
                      height: MediaQuery.of(context).size.height / 4,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: cubit.currentTestScreen != 16
                        ? Text(
                            textAlign: TextAlign.center,
                            testQuestions[cubit.currentTestScreen],
                            style: const TextStyle(
                                color: fontColor,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          )
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                ' عالي',
                                style: TextStyle(
                                    color: Color(0xffFFB4AB),
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                ' إحتمال الإصابة',
                                style: TextStyle(
                                    color: Color(0xffE3E2E6),
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),

                  ///////// Choose Data Here//////////

                  if (cubit.currentTestScreen != 0 &&
                      cubit.currentTestScreen != 16)
                    (() {
                      if (cubit.currentTestScreen == 11) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: TextField(
                            style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Color(0xffCCCCCC)),
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.none,
                            decoration: InputDecoration(
                              border: const OutlineInputBorder(),
                              hintText: 'العمر',
                              hintStyle: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color:
                                      const Color(0xffCCCCCC).withOpacity(0.5)),
                            ),
                            controller: dateController,
                            onTap: () async {
                              final DateTime? picked = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(2015, 8),
                                  lastDate: DateTime(2025, 1));
                              if (picked != null) {
                                dateController.text = picked.year.toString() +
                                    "/" +
                                    picked.month.toString() +
                                    "/" +
                                    picked.day.toString();
                              }
                            },
                          ),
                        );
                      } else if (cubit.currentTestScreen == 15) {
                        return Container(
                          decoration: BoxDecoration(
                              border:
                                  Border.all(width: 0.5, color: Colors.grey)),
                          child: DropdownButton<String>(
                            value: cubit.selectedEthnicity < 0
                                ? null
                                : cubit.selectedEthnicity.toString(),
                            elevation: 0,
                            underline: const SizedBox(),
                            icon: const SizedBox(),
                            isExpanded: true,
                            iconSize: 30.0,
                            style: const TextStyle(color: Colors.blue),
                            hint: const Align(
                                alignment: Alignment.centerRight,
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 10.0),
                                  child: Text(
                                    'العرق',
                                    style: TextStyle(color: Colors.blue),
                                  ),
                                )),
                            items: ethnicityList.asMap().entries.map((value) {
                              return DropdownMenuItem<String>(
                                alignment: Alignment.centerRight,
                                value: value.key.toString(),
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 10.0),
                                  child: Text(value.value),
                                ),
                              );
                            }).toList(),
                            onChanged: (val) {
                              cubit.changeEthnicity(int.parse(val!));
                            },
                          ),
                        );
                      } else {
                        return YesOrNoWidget(cubit);
                      }
                    }()),
                  ///////////////////////////////
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget YesOrNoWidget(AppCubit cubit) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          child: Container(
            width: 90,
            height: 40,
            decoration: BoxDecoration(
              color: cubit.testQueChecked == null
                  ? Colors.transparent
                  : (cubit.testQueChecked == true
                      ? Colors.transparent
                      : const Color(0xffA8C8FF)),
              border: Border.all(
                width: .5,
                color: const Color(0xff8E9199),
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Text(
                cubit.currentTestScreen == 12 ? 'انثي' : 'لا',
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: cubit.testQueChecked == null
                        ? const Color(0xffCCCCCC)
                        : (cubit.testQueChecked == true
                            ? const Color(0xffCCCCCC)
                            : const Color(0xff05305F))),
              ),
            ),
          ),
          onTap: () {
            cubit.checkChanged(false);
          },
        ),
        const SizedBox(
          width: 30,
        ),
        GestureDetector(
          child: Container(
            width: 90,
            height: 40,
            decoration: BoxDecoration(
              color: cubit.testQueChecked == null
                  ? Colors.transparent
                  : (cubit.testQueChecked == true
                      ? const Color(0xffA8C8FF)
                      : Colors.transparent),
              border: Border.all(
                width: .5,
                color: const Color(0xff8E9199),
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Text(
                cubit.currentTestScreen == 12 ? 'ذكر' : 'نعم',
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: cubit.testQueChecked == null
                        ? const Color(0xffCCCCCC)
                        : (cubit.testQueChecked == true
                            ? const Color(0xff05305F)
                            : const Color(0xffCCCCCC))),
              ),
            ),
          ),
          onTap: () {
            cubit.checkChanged(true);
          },
        ),
      ],
    );
  }
}
