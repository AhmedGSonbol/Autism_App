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
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                Center(
                  child: Image(//      assets/images/test_images/test0.png
                    image: AssetImage('assets/images/test_images/test14.png'),
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
                          cubit.nextTestQuestion();
                          print('ssss');
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
        );

      },

    );
  }
}
