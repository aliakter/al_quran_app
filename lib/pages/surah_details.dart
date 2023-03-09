// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, sized_box_for_whitespace, unused_local_variable, sort_child_properties_last

import 'package:al_quran_app/services/api_services.dart';
import 'package:flutter/material.dart';
import 'package:solid_bottom_sheet/solid_bottom_sheet.dart';

import '../constants/constants.dart';
import '../models/translation.dart';
import '../widgets/custom_translation.dart';

enum Translation {urdu, hindi, english}

class SurahDetail extends StatefulWidget {
  static const String id = 'surahDetail_screen';
  const SurahDetail({Key? key}) : super(key: key);

  @override
  State<SurahDetail> createState() => _SurahDetailState();
}

class _SurahDetailState extends State<SurahDetail> {
  ApiServices apiServices = ApiServices();
  Translation? _translation = Translation.urdu;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: FutureBuilder(
          future: apiServices.getTranslation(Constants.surahIndex!, _translation!.index),
          builder: (BuildContext context,
              AsyncSnapshot<SurahTranslationList> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasData) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 50),
                child: ListView.builder(
                  itemCount: snapshot.data!.translationList.length,
                  itemBuilder: (context, index) {
                    return TranslationTile(
                        index: index,
                        surahTranslation: snapshot.data!.translationList[index]);
                  },
                ),
              );
            } else
              return Center(
                child: Text('Translation Not found'),
              );
          },
        ),
        bottomSheet: SolidBottomSheet(
          headerBar: Container(
            color: Theme.of(context).primaryColor,
            height: 50,
            child: Center(
              child: Text(
                "Swipe", style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          body: Container(
            color: Colors.white,
            height: 30,
            child: SingleChildScrollView(
              child: Center(
                child: Column(
                  children: <Widget>[
                    ListTile(
                      title: const Text('Urdu'),
                      leading: Radio<Translation>(
                        value: Translation.urdu,
                        groupValue: _translation,
                        onChanged: (Translation? value) {
                          setState(() {
                            _translation = value;
                          });
                        },
                      ),
                    ),
                    ListTile(
                      title: const Text('Hindi'),
                      leading: Radio<Translation>(
                        value: Translation.hindi,
                        groupValue: _translation,
                        onChanged: (Translation? value) {
                          setState(() {
                            _translation = value;
                          });
                        },
                      ),
                    ),
                    ListTile(
                      title: const Text('English'),
                      leading: Radio<Translation>(
                        value: Translation.english,
                        groupValue: _translation,
                        onChanged: (Translation? value) {
                          setState(() {
                            _translation = value;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
