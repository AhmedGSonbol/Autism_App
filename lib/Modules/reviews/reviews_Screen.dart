// ignore_for_file: prefer_const_constructors

import 'package:autism/Shared/Constants/Constants.dart';
import 'package:autism/Shared/components/components.dart';
import 'package:flutter/material.dart';

class Reviews_Screen extends StatelessWidget {
  const Reviews_Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.all(10.0),
      child: Column(
        children: [
          Expanded(
            child: ListView.separated(
              itemBuilder: (context, index) => bulidPostItem(text: 'testooooooooooo oooooooooooooooo ooooooooooooo oooooooooooooo iiiiiiiiiiii pppppppppppppp [[[[[[[[[[[[[[[ jjjjjjjjjjjjjjj mmmmmmmmmmmmm bbbbbbbbbbbbb hhhhhhhhhhhhhhh jjjjjjjjjjjjjjj kkkkkkkkkkkk lllllllllllll mmmmmmmmm jjjjjjjjjjjjjjj hhhhhhhhhhhhhhh uuuuuuuuuuuuu knknkn kn kjn jn jn jn jn jn jn j nj n jn jn jn j n'),
              separatorBuilder: (context, index) => SizedBox(
                height: 10,
              ),
              itemCount: 20,
            ),
          ),
        ],
      ),
    );
  }
}
