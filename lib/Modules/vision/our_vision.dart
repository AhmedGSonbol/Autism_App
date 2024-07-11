// ignore_for_file: prefer_const_constructors, unnecessary_import, deprecated_member_use

import 'package:autism/Shared/styles/colors.dart';
import 'package:autism/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Our_Vision extends StatelessWidget {
  const Our_Vision({super.key});

  @override
  Widget build(BuildContext context)
  {
    var la = S.of(context);
    AppColors colors = AppColors(context);
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
          la.ourVision,
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: colors.fontColor(),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: SingleChildScrollView(
          padding: EdgeInsets.only(bottom: 30.0),
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              SizedBox(
                width: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:
                [
                  Text(
                    la.autiSociety,
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        color: mainColor, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Image.asset('assets/images/icon2.png'),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'AutiSociety',
                style: Theme.of(context)
                    .textTheme
                    .headlineLarge
                    ?.copyWith(color: colors.fontColor(), fontWeight: FontWeight.w900),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                height: 350,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/view.png'),
                      fit: BoxFit.cover),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  decoration: BoxDecoration(
                    color: colors.home_drawer_item_background(),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    la.aim,
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge
                        ?.copyWith(color: colors.fontColor(), fontSize: 20),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
