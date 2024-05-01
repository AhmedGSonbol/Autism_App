import 'package:autism/Shared/components/components.dart';
import 'package:autism/Shared/styles/colors.dart';
import 'package:flutter/material.dart';

class Admin_Settings_Screen extends StatelessWidget {
  const Admin_Settings_Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: appBarColor,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
          color: const Color(0xffE1E2E9),
        ),
        title: const Text(
          'الإعدادات',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Color(0xffE1E2E9),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsetsDirectional.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsetsDirectional.only(top: 16),
                decoration: BoxDecoration(
                  color: const Color(0xff282A2F),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Center(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 40,
                          decoration: BoxDecoration(
                              color: const Color(0xffBDC7DC),
                              borderRadius: BorderRadius.circular(30)),
                          child: const Center(
                            child: Text(
                              'اﻹشعارات',
                              style: TextStyle(
                                  color: Color(0xff273141),
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            mySwitch(),
                            const Spacer(),
                            const Text(
                              'اﻹشعارات',
                              style: TextStyle(
                                  color: fontColor,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                width: double.infinity,
                padding: const EdgeInsetsDirectional.only(top: 16),
                decoration: BoxDecoration(
                    color: const Color(0xff282A2F),
                    borderRadius: BorderRadius.circular(30)),
                child: Center(
                  child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Container(
                            height: 40,
                            decoration: BoxDecoration(
                                color: const Color(0xffF8D8FE),
                                borderRadius: BorderRadius.circular(30)),
                            child: const Center(
                              child: Text(
                                'إمكانية اﻵخرين',
                                style: TextStyle(
                                    color: Color(0xff3E2845),
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              mySwitch(),
                              const Spacer(),
                              const Text(
                                'رؤية اﻹيميل',
                                style: TextStyle(
                                    color: fontColor,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ],
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
