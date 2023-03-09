// ignore_for_file: prefer_const_constructors

import 'package:al_quran_app/constants/constants.dart';
import 'package:al_quran_app/pages/juz_screen.dart';
import 'package:al_quran_app/pages/surah_details.dart';
import 'package:al_quran_app/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Al Quran',
      theme: ThemeData(
        primarySwatch: Constants.kSwatchColor,
        primaryColor: Constants.kPrimary,
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'Poppins',
      ),
      home: SplashScreen(),
      routes: {
        JuzScreen.id: (context) => JuzScreen(),
        SurahDetail.id: (context) => SurahDetail(),
      },
    );
  }
}
