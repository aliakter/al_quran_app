// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, sized_box_for_whitespace, unused_local_variable, sort_child_properties_last

import 'dart:async';
import 'package:al_quran_app/onboarding_screen.dart';
import 'package:al_quran_app/pages/home_screen.dart';
import 'package:al_quran_app/pages/qarilist_screen.dart';
import 'package:al_quran_app/pages/quran_screen.dart';
import 'package:al_quran_app/size/size.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'main_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool alreadyUsed = false;

  void getData() async {
    // Obtain shared preferences.
    final prefs = await SharedPreferences.getInstance();
    alreadyUsed = prefs.getBool("alreadyUsed") ?? false;
    // onBoarding screen will show for first time
  }

  @override
  void initState() {
    super.initState();
    getData();
    Timer(
      Duration(seconds: 2),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => alreadyUsed ? MainScreen() : OnboardingScreen(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey,
        body: Container(
          width: SizeConfig.screenWidth,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/1000_F_525208019.png'),
            ),
          ),
        ),
      ),
    );
  }
}
