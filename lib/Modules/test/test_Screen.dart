import 'package:autism/Shared/components/components.dart';
import 'package:autism/Shared/cubit/cubit.dart';
import 'package:autism/Shared/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Test_Screen extends StatelessWidget
{
  const Test_Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context)
  {

    var dateController = TextEditingController();

    var cubit = AppCubit.get(context);

    return BlocConsumer<AppCubit,AppStates>(
      listener: (context, state) {},
      builder: (context, state)
      {
        return Scaffold(
          backgroundColor: const Color(0xff1d2024),
          appBar: AppBar(
            backgroundColor: const Color(0xff1d2024),
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back),
              color: const Color(0xffE1E2E9),
            ),
            title: const Text(
              'التشخيص',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                fontFamily: 'Roboto',
                color: Color(0xffE1E2E9),
              ),
            ),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                children:
                [

                  Center(
                    child: Image(//      assets/images/test_images/test0.png
                      image: AssetImage('assets/images/test_images/test${cubit.currentTestScreen}.png'),
                      fit: BoxFit.cover,
                      height: MediaQuery.of(context).size.height / 3,
                    ),


                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: Text(
                      textAlign: TextAlign.center,
                      cubit.testQuestions[cubit.currentTestScreen],
                      style: TextStyle(
                          color: Color(0xffE1E2E9),
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),

                  ///////// Choose Data Here//////////

                  if(cubit.currentTestScreen != 0)
                  (()
                  {
                    if(cubit.currentTestScreen == 11)
                    {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: TextField(
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color:  Color(0xffCCCCCC)
                          ),
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.none,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'العمر',
                            hintStyle: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color:  Color(0xffCCCCCC).withOpacity(0.5)
                            ),



                          ),
                          controller: dateController,
                          onTap: ()async
                          {
                            final DateTime? picked = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(2015, 8),
                                lastDate: DateTime(2025,1));
                            if (picked != null)
                            {
                              dateController.text = picked.year.toString() + "/" + picked.month.toString();
                            }
                          },
                        ),
                      );
                    }
                    else if(cubit.currentTestScreen == 15)
                    {
                      return Container();
                    }
                    else
                    {
                      return YesOrNoWidget(cubit);
                    }

                  }
                    ()),




                  ///////////////////////////////
                  SizedBox(
                    height: 20,
                  ),
                  const Divider(
                    thickness: .5,
                    color: Colors.grey,
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children:
                      [
                        if(cubit.currentTestScreen != 0)
                          defaultElevatedButton(
                            onPressed: ()
                            {
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
                          onPressed: ()
                          {
                            if(cubit.testQueChecked != null || cubit.currentTestScreen == 0)
                            {
                              cubit.nextTestQuestion();
                            }
                            else
                            {
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('برجاء اختيار إجابة اولاً')));
                            }



                          },
                          text: 'التالي',
                          color: const Color(0xffA8C8FF),
                          textColor: const Color(0xff05305F),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );

      },

    );
  }

  Widget YesOrNoWidget(AppCubit cubit)
  {

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children:
      [
        GestureDetector(
          child: Container(
            width: 90,
            height: 40,
            decoration: BoxDecoration(
              color:cubit.testQueChecked == null ? Colors.transparent : (cubit.testQueChecked == true ? Colors.transparent: const Color(0xffA8C8FF)) ,
              border: Border.all(
                width: .5,
                color:Color(0xff8E9199),
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Text(
                'لا',
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: cubit.testQueChecked == null ? Color(0xffCCCCCC) : (cubit.testQueChecked == true ? Color(0xffCCCCCC): const Color(0xff05305F))),
              ),
            ),
          ),
          onTap: ()
          {
            cubit.checkAction(false);
          },
        ),
        SizedBox(
          width: 30,
        ),
        GestureDetector(
          child: Container(
            width: 90,
            height: 40,
            decoration: BoxDecoration(
              color: cubit.testQueChecked == null ? Colors.transparent : (cubit.testQueChecked == true ? Color(0xffA8C8FF) : Colors.transparent ),
              border: Border.all(
                width: .5,
                color: Color(0xff8E9199),
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Text(
                'نعم',
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: cubit.testQueChecked == null ? Color(0xffCCCCCC) : (cubit.testQueChecked == true ?Color(0xff05305F) : Color(0xffCCCCCC) )),
              ),
            ),
          ),
          onTap: ()
          {
            cubit.checkAction(true);
          },
        ),
      ],
    );

  }
}
