// ignore_for_file: prefer_const_constructors, prefer_final_fields, unused_field, no_leading_underscores_for_local_identifiers, unused_local_variable, prefer_const_literals_to_create_immutables

import 'package:al_quran_app/models/surah.dart';
import 'package:flutter/material.dart';

Widget SurahCustomListTile(
    {required Surah surah,
    required BuildContext context,
    required VoidCallback onTap}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
          color: Colors.black12,
          blurRadius: 3.0,
        ),
      ]),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                alignment: Alignment.center,
                height: 48,
                width: 48,
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.black,
                ),
                child: Text(
                  (surah.number).toString(),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(surah.englishName!,
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  Text(surah.englishNameTranslation!),
                ],
              ),
              Spacer(),
              Text(
                surah.name!,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.black87,
                ),
              ),
            ],
          )
        ],
      ),
    ),
  );
}
