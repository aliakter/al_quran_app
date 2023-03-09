// ignore_for_file: prefer_const_constructors, prefer_final_fields, unused_field, no_leading_underscores_for_local_identifiers, unused_local_variable, prefer_const_literals_to_create_immutables

import 'package:al_quran_app/models/qari.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import '../models/surah.dart';

class AudioScreen extends StatefulWidget {
  final Qari qari;
  final int index;
  final List<Surah>? list;
  const AudioScreen({Key? key, required this.qari, required this.index, this.list}) : super(key: key);

  @override
  State<AudioScreen> createState() => _AudioScreenState();
}

class _AudioScreenState extends State<AudioScreen> {
  final _player = AudioPlayer();
  bool isLoopingCurrentItem = false;
  Duration defaultDuration = Duration(milliseconds: 1);
  String? ind;
  int currentIndex = 0;
  int dataIndex = 0;

  @override
  void initState() {
    setState(() {
      currentIndex = widget.index-1;
      dataIndex = widget.index-1;
    });

    // Surah is from 1 to 114 so
    // 001 , 002 , 003 ..... 010, 011, 012, ..... 099, 100, 101, ...114
    if(widget.index<10) {
      ind = "00"+(widget.index.toString());
    } else if (widget.index<100) {
      ind = "0"+(widget.index.toString());
    } else if (widget.index>100) {
      ind = (widget.index.toString());
    }

    // _initAudioPlayer(ind!, widget.qari);

    print('index ${widget.index} current Index ${currentIndex}');
    super.initState();
  }

  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }

  void didChangeAppLifecycleState(AppLifecycleState state) {

  }


  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
