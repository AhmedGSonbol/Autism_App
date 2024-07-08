// ignore_for_file: prefer_const_constructors, unnecessary_import, prefer_const_literals_to_create_immutables, deprecated_member_use, avoid_unnecessary_containers

import 'package:autism/Shared/styles/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class About_Screen extends StatelessWidget {
  const About_Screen({super.key});

  @override
  Widget build(BuildContext context)
  {
    AppColors colors = AppColors(context);

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_forward),
              color: colors.fontColor(),
            ),

          ],
          leading: SizedBox(),
          centerTitle: true,
          title:  Text(
            'عنا',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: colors.fontColor(),
            ),
          ),
        ),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.only(bottom: 50.0),
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Society',
                    style: Theme.of(context).textTheme.displaySmall?.copyWith(
                          color: Color(0xffA8C8FF),
                        ),
                  ),
                  Text(
                    'Auti',
                    style: Theme.of(context).textTheme.displaySmall?.copyWith(
                          color: Color(0xffDBBCE1),
                        ),
                  ),
                ],
              ),
              SizedBox(
                height: 40,
              ),
              Container(
                height: 300,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/us.png'),
                      fit: BoxFit.cover),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                'مجتمع التوحد',
                style: Theme.of(context)
                    .textTheme
                    .headline3
                    ?.copyWith(color: colors.fontColor()),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children:
                  [
                    Text(
                      textAlign: TextAlign.center,
                      'هو مشروع تخرج طلاب الفرقة الرابعة في كلية الحاسبات و المعلومات جامعة دمنهور بالنوبارية',
                      style: Theme.of(context)
                          .textTheme
                          .headline6
                          ?.copyWith(color: colors.fontColor()),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color:  colors.home_drawer_item_background(),
                        borderRadius: BorderRadiusDirectional.only(
                          topStart: Radius.circular(20),
                          topEnd: Radius.circular(20),
                          bottomStart: Radius.circular(20),
                          bottomEnd: Radius.circular(20),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: Column(
                          children:
                          [
                            Text(
                              'إدارة و إشراف',
                              style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                                  color: mainColor, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 10,),
                            Text(
                              'أ.د نورا شعيب',
                              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                                  color: colors.fontColor(), fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 40,
                            ),
                            Text(
                              'أعضاء المشروع',
                              style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                                  color: mainColor, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'أحمد سنبل',
                              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                                  color: colors.fontColor(), fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'محمد عمار',
                              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                                  color: colors.fontColor(), fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'محمد عاطف',
                              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                                  color: colors.fontColor(), fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'أحمد رمضان',
                              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                                  color: colors.fontColor(), fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'محمد خميس',
                              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                                  color: colors.fontColor(), fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
