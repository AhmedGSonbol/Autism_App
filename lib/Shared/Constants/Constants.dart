import 'dart:ui';
import 'package:flutter/material.dart';




String token = '' ;
String userType = '' ;


void printFullText(String text)
{
  final pattern = RegExp('.{1,800}'); // 800 is the size of each chunk
  pattern.allMatches(text).forEach((match) => print(match.group(0)));
}

String baseURL = 'https://s3.autisociety17.serv00.net';

// String baseURL = 'http://192.168.2.5:5000';

String current_lang = 'en';