// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, sized_box_for_whitespace, unused_local_variable, unused_import, prefer_final_fields, unused_field

import 'package:al_quran_app/pages/home_screen.dart';
import 'package:al_quran_app/pages/qarilist_screen.dart';
import 'package:al_quran_app/pages/quran_screen.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selectindex = 0;
  final _widgetsList = [
    HomeScreen(),
    QuranScreen(),
    QariListScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: _widgetsList[selectindex],
          bottomNavigationBar: CurvedNavigationBar(
            buttonBackgroundColor: Colors.yellow,
            backgroundColor: Colors.white,
            color: Colors.deepPurple,
            animationDuration: Duration(milliseconds: 300),
            items: [
              Tab(
                icon: Image.asset('assets/images/home.png'),
                height: 30.0,
              ),
              Tab(
                icon: Image.asset('assets/images/holyQuran.png'),
                height: 30.0,
              ),
              Tab(
                icon: Image.asset('assets/images/audio.png'),
                height: 30.0,
              ),
            ],
            onTap: (index) {
              setState(() {
                selectindex = index;
              });
            },
          )),
    );
  }
}
