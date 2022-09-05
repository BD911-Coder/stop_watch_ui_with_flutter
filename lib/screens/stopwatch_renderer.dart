import 'dart:math';

import 'package:flutter/material.dart';
import 'package:stop_watch/screens/elapsed_time_text.dart';
import 'package:stop_watch/utils/app_layout.dart';

class StopwatchRenderer extends StatelessWidget {
  const StopwatchRenderer({Key? key, required this.elapsedTime})
      : super(key: key);

  final Duration elapsedTime;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Transform(
          transform: Matrix4.identity()
            ..translate(50.0, 0.0, 0.0)
            ..rotateZ(pi / 4),
          // transform:
          //     Matrix4.translationValues(50, 0, 0) * Matrix4.rotationZ(pi / 4),
          alignment: Alignment.center,
          child: Container(
            color: Colors.red,
          ),
        ),
        // ElapsedTimeText(
        //   elapsed: elapsedTime,
        // ),
      ],
    );
  }
}
