// ignore_for_file: prefer_const_constructors, prefer_final_fields, unused_field, no_leading_underscores_for_local_identifiers, unused_local_variable, prefer_const_literals_to_create_immutables

import 'package:al_quran_app/models/surah.dart';
import 'package:al_quran_app/services/api_services.dart';
import 'package:flutter/material.dart';
import '../models/qari.dart';
import '../widgets/qari_custom_tile.dart';
import 'audio_surah_screen.dart';

class QariListScreen extends StatefulWidget {
  const QariListScreen({Key? key}) : super(key: key);

  @override
  State<QariListScreen> createState() => _QariListScreenState();
}

class _QariListScreenState extends State<QariListScreen> {
  ApiServices apiServices = ApiServices();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Qaris"),
          centerTitle: true,
        ),
        body: Padding(
          padding: EdgeInsets.only(top: 20, left: 12, right: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 12),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(32),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black54,
                        blurRadius: 1,
                        spreadRadius: 0.0,
                        offset: Offset(0, 1),
                      ),
                    ]),
                child: Padding(
                  padding: EdgeInsets.all(14.0),
                  child: Row(
                    children: [
                      Text('Search'),
                      Spacer(),
                      Icon(Icons.search),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              Expanded(
                child: FutureBuilder(
                  future: apiServices.getQariList(),
                  builder: (BuildContext context,
                      AsyncSnapshot<List<Qari>> snapshot) {
                    if (snapshot.hasError) {
                      return Center(
                        child: Text("Qaris data not found"),
                      );
                    }
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        return QariCustomTile(
                          qari: snapshot.data![index],
                          ontap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => AudioSurahScreen()));
                          },
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
