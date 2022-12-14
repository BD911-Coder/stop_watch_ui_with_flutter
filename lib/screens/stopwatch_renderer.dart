import 'dart:math';

import 'package:flutter/material.dart';
import 'package:stop_watch/screens/elapsed_time_text.dart';
import 'package:stop_watch/screens/widgets/clock_hand.dart';
import 'package:stop_watch/screens/widgets/clock_markers.dart';
import 'package:stop_watch/utils/app_layout.dart';

class StopwatchRenderer extends StatelessWidget {
  const StopwatchRenderer(
      {Key? key, required this.elapsedTime, required this.radius})
      : super(key: key);

  final Duration elapsedTime;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        for (var i = 0; i < 60; i++)
          Positioned(
            left: radius,
            top: radius,
            child: ClockSecondsTickMarker(seconds: i, radius: radius),
          ),
        for (var i = 0; i <= 60; i += 5)
          Positioned(
            left: radius,
            top: radius,
            child: ClockTextMarker(value: i, maxValue: 60, radius: radius),
          ),
        Positioned(
          left: radius,
          top: radius,
          child: ClockHand(
            rotationZAngle: pi + (2 * pi / 60000) * elapsedTime.inMilliseconds,
            handThickness: 2,
            handLength: radius,
            color: Colors.orange,
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          top: radius * 1.3,
          child: ElapsedTimeText(
            elapsed: elapsedTime,
          ),
        ),
      ],
    );
  }
}
