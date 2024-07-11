// ignore_for_file: prefer_const_constructors, unnecessary_import, prefer_const_literals_to_create_immutables, deprecated_member_use, avoid_unnecessary_containers

import 'package:autism/Shared/styles/colors.dart';
import 'package:autism/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class About_Screen extends StatelessWidget {
  const About_Screen({super.key});

  @override
  Widget build(BuildContext context)
  {
    AppColors colors = AppColors(context);
    var la = S.of(context);

    return Scaffold(
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
          la.aboutUs,
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
              la.autiSociety,
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium
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
                    la.projectDescription,
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall
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
                            la.managementSupervision,
                            style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                                color: mainColor, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 10,),
                          Text(
                            la.managementSupervisor,
                            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                                color: colors.fontColor(), fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          Text(
                            la.projectMembers,
                            style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                                color: mainColor, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            la.member1,
                            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                                color: colors.fontColor(), fontWeight: FontWeight.bold),
                          ),
                          Text(
                            la.member2,
                            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                                color: colors.fontColor(), fontWeight: FontWeight.bold),
                          ),
                          Text(
                            la.member3,
                            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                                color: colors.fontColor(), fontWeight: FontWeight.bold),
                          ),
                          Text(
                            la.member4,
                            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                                color: colors.fontColor(), fontWeight: FontWeight.bold),
                          ),
                          Text(
                            la.member5,
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
    );
  }
}
