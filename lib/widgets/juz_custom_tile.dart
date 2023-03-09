// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, sized_box_for_whitespace, unused_local_variable, sort_child_properties_last

import 'package:flutter/material.dart';
import '../models/juz.dart';

class JuzCustomTile extends StatelessWidget {
  final List<JuzAyahs> list;
  final int index;
  const JuzCustomTile({Key? key, required this.list, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 3.0,
          ),
        ]
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(list[index].ayahNumber.toString()),
          Text(list[index].ayahsText, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
          textAlign: TextAlign.end,
          ),
          Text(list[index].surahName, textAlign: TextAlign.end),
        ],
      ),
    );
  }
}
