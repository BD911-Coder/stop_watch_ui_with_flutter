import 'dart:async';

import 'package:flutter/material.dart';

import 'elapsed_time_text_basic.dart';

class Stopwatch extends StatefulWidget {
  @override
  _StopwatchState createState() => _StopwatchState();
}

class _StopwatchState extends State<Stopwatch> {
  late DateTime _initialTime;
  Duration _elapsedTime = Duration.zero;

  @override
  void initState() {
    super.initState();
    _initialTime = DateTime.now();
    Timer.periodic(
      Duration(microseconds: 50),
      (_timer) {
        final now = DateTime.now();
        setState(() {
          _elapsedTime = now.difference(_initialTime);
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ElapsedTimeTextBasic(
      elapsed: _elapsedTime,
    );
  }
}
