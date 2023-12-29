import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:onlinedabba/AUTH/login.dart';
import 'package:onlinedabba/UserModel.dart';
import 'package:onlinedabba/WelcomePage.dart';
import 'package:onlinedabba/home.dart';
import 'package:onlinedabba/AUTH/signup.dart';
import 'package:onlinedabba/mainpage.dart';
import 'package:onlinedabba/showMesspage.dart';
import 'package:onlinedabba/splashScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'OnlineDabba',
      debugShowCheckedModeBanner: false,
      initialRoute: 'splash',
      routes: {
        'home': (context) => Home(),
        'login': (context) => LoginPage(),
        'signup': (context) => SignupPage(),
        'welcome': (context) => WelcomePage(),
        'splash': (context) => SplashPage(),
        'mainpage': (context) => MainPage(),
        'showMesspage': (context) => ShowMessPage(),
      },
    );
  }
}
