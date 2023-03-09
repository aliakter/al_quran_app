// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, sized_box_for_whitespace, unused_local_variable, sort_child_properties_last

import 'package:al_quran_app/constants/constants.dart';
import 'package:al_quran_app/pages/surah_details.dart';
import 'package:al_quran_app/services/api_services.dart';
import 'package:flutter/material.dart';
import '../models/surah.dart';
import '../widgets/widget_custom_tile.dart';
import 'juz_screen.dart';

class QuranScreen extends StatefulWidget {
  const QuranScreen({super.key});

  @override
  State<QuranScreen> createState() => _QuranScreenState();
}

class _QuranScreenState extends State<QuranScreen> {
  ApiServices apiServices = ApiServices();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: 0,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text("Quran"),
            centerTitle: true,
            bottom: TabBar(
              tabs: [
                Text(
                  'Surah',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 17),
                ), //index - 0 //Text
                Text(
                  'Sajda',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 17),
                ), //index - 1 //Text
                Text(
                  'Juz',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 17),
                ), // index - 2 //Text
              ],
            ),
          ),
          body: TabBarView(children: <Widget>[
            FutureBuilder(
              future: apiServices.getSurah(),
              builder:
                  (BuildContext context, AsyncSnapshot<List<Surah>> snapshot) {
                if (snapshot.hasData) {
                  List<Surah>? surah = snapshot.data;
                  return ListView.builder(
                    itemCount: surah!.length,
                    itemBuilder: (context, index) => SurahCustomListTile(
                        surah: surah[index],
                        context: context,
                        onTap: () {
                          setState(() {
                            Constants.surahIndex = (index + 1);
                          });
                          Navigator.pushNamed(context, SurahDetail.id);
                        }),
                  );
                }
                return Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
            Center(
              child: Text("Sajda here"),
            ),
            GestureDetector(
              child: Container(
                padding: EdgeInsets.all(8.0),
                child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                    ),
                    itemCount: 30,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            Constants.juzIndex = (index + 1);
                          });
                          Navigator.pushNamed(context, JuzScreen.id);
                        },
                        child: Card(
                          elevation: 0,
                          color: Colors.blueGrey,
                          child: Center(
                            child: Text(
                              '${index + 1} ',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                          ),
                        ),
                      );
                    }),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
