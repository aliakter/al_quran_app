// ignore_for_file: prefer_const_constructors

import 'package:al_quran_app/constants/constants.dart';
import 'package:al_quran_app/main_screen.dart';
import 'package:al_quran_app/pages/home_screen.dart';
import 'package:al_quran_app/pages/quran_screen.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: IntroductionScreen(
          pages: [
            PageViewModel(
              title: "Read Quran",
              bodyWidget: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Customize your reading view, read in multiple language, listen different audio.",
                      style: TextStyle(fontSize: 16),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
              image: Center(child: Image.asset('assets/images/quran.png')),
            ),
            PageViewModel(
              title: "Prayer Alarts",
              bodyWidget: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Choose your adhan , which prayer to be notified of and how often. ",
                      style: TextStyle(fontSize: 16),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
              image: Center(child: Image.asset('assets/images/prayer.png')),
            ),
            PageViewModel(
              title: "Build Better Habits",
              bodyWidget: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Make Islamic practices a part or your daily life in a way that best suits your life ",
                      style: TextStyle(fontSize: 16),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
              image: Center(child: Image.asset('assets/images/zakat.png')),
            ),
          ],
          showNextButton: true,
          showSkipButton: true,
          skipColor: Colors.black,
          next: const Icon(
            Icons.arrow_forward,
            color: Colors.black,
          ),
          done:
              const Text("Done", style: TextStyle(fontWeight: FontWeight.w600)),
          onDone: () {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => MainScreen()));
          },
          skip: Text("Skip", style: TextStyle(fontWeight: FontWeight.w600)),
          onSkip: () {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => MainScreen()));
          },
          dotsDecorator: DotsDecorator(
            size: const Size.square(10.0),
            activeSize: const Size(20.0, 10.0),
            activeColor: Constants.kPrimary,
            color: Colors.grey,
            spacing: const EdgeInsets.symmetric(horizontal: 3.0),
            activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25.0),
            ),
          ),
        ),
      ),
    );
  }
}
