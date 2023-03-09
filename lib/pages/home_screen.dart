// ignore_for_file: prefer_const_constructors, prefer_final_fields, unused_field, no_leading_underscores_for_local_identifiers, unused_local_variable, prefer_const_literals_to_create_immutables

import 'package:al_quran_app/models/aya_of_the_day.dart';
import 'package:al_quran_app/services/api_services.dart';
import 'package:flutter/material.dart';
import 'package:hijri/hijri_calendar.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ApiServices _apiServices = ApiServices();

  void setData() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool("alreadyUsed", true);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setData();
  }

  @override
  Widget build(BuildContext context) {
    var _size = MediaQuery.of(context).size;
    HijriCalendar.setLocal('ar');
    var _hijri = HijriCalendar.now();
    var day = DateTime.now();
    var format = DateFormat('EEE, dd MMM yyyy');
    var formatted = format.format(day);

    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              height: _size.height * 0.25,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/images/ashkan-forouzani.jpg'),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      formatted,
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                        children: [
                          WidgetSpan(
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Text(
                                _hijri.hDay.toString(),
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.green,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          WidgetSpan(
                            child: Padding(
                              padding: EdgeInsets.all(4.0),
                              child: Text(
                                _hijri.longMonthName,
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.green,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          WidgetSpan(
                            child: Padding(
                              padding: EdgeInsets.all(4),
                              child: Text(
                                ' ${_hijri.hYear} AH',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.green,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsetsDirectional.only(top: 10, bottom: 20),
                child: Column(
                  children: [
                    FutureBuilder<AyaOfTheDay>(
                        future: _apiServices.getAyaOfTheDay(),
                        builder: (context, snapshot) {
                          switch(snapshot.connectionState) {
                            case ConnectionState.none:
                              return Icon(Icons.sync_problem);
                            case ConnectionState.waiting:
                            case ConnectionState.active:
                              return CircularProgressIndicator();
                            case ConnectionState.done:
                              return Container(
                                margin: EdgeInsetsDirectional.all(16),
                                padding: EdgeInsetsDirectional.all(20),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(32),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 3,
                                      spreadRadius: 1,
                                      offset: Offset(0, 1),
                                    ),
                                  ]
                                ),
                                child: Column(
                                  children: [
                                    Text(
                                      "Quran Aya of the Day",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                      ),
                                    ),
                                    Divider(color: Colors.black, thickness: 0.5),
                                    Text(
                                      snapshot.data!.arText!,
                                      style: TextStyle(color: Colors.black54, fontSize: 18),
                                      textAlign: TextAlign.center,
                                    ),
                                    Text(
                                      snapshot.data!.enTran!,
                                      style: TextStyle(
                                        color: Colors.black54,
                                        fontSize: 18,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                    RichText(
                                      text: TextSpan(
                                          children: <InlineSpan>[
                                            WidgetSpan(
                                              child: Padding(
                                                padding: EdgeInsets.all(8.0),
                                                child: Text(snapshot.data!.surNumber!.toString(),style: TextStyle(fontSize: 16),),
                                              ),
                                            ),
                                            WidgetSpan(
                                              child: Padding(
                                                padding: EdgeInsets.all(8.0),
                                                child: Text(snapshot.data!.surEnName!,style: TextStyle(fontSize: 16),),
                                              ),
                                            ),
                                          ]
                                      ),
                                    ),
                                  ],
                                ),
                              );
                          }
                        },
                    ),

                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
