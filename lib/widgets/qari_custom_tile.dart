// ignore_for_file: prefer_const_constructors, prefer_final_fields, unused_field, no_leading_underscores_for_local_identifiers, unused_local_variable, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

import '../models/qari.dart';

class QariCustomTile extends StatefulWidget {
  final Qari qari;
  final VoidCallback ontap;
  const QariCustomTile({Key? key, required this.qari, required this.ontap})
      : super(key: key);

  @override
  State<QariCustomTile> createState() => _QariCustomTileState();
}

class _QariCustomTileState extends State<QariCustomTile> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.ontap,
      child: Padding(
        padding: EdgeInsets.all(4.0),
        child: Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.all(Radius.circular(8)),
              boxShadow: [
                BoxShadow(
                  blurRadius: 5,
                  spreadRadius: 0,
                  color: Colors.black12,
                  offset: Offset(0, 1),
                ),
              ]),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.qari.name!,
                textAlign: TextAlign.start,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
