import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:stop_watch/screens/reset_button.dart';
import 'package:stop_watch/screens/start_stop_button.dart';
import 'package:stop_watch/screens/stopwatch_renderer.dart';

class Stopwatch extends StatefulWidget {
  const Stopwatch({super.key});

  @override
  _StopwatchState createState() => _StopwatchState();
}

class _StopwatchState extends State<Stopwatch>
    with SingleTickerProviderStateMixin {
  Duration _previouslyElapsedTime = Duration.zero;
  Duration _currentlyElapsedTime = Duration.zero;
  Duration get _elapsedTime => _previouslyElapsedTime + _currentlyElapsedTime;

  late final Ticker _ticker;
  bool _isRunning = false;

  @override
  void initState() {
    super.initState();
    _ticker = createTicker(
      (elapsed) {
        setState(() {
          _currentlyElapsedTime = elapsed;
        });
      },
    );
  }

  @override
  void dispose() {
    _ticker.dispose();
    super.dispose();
  }

  void _toggleRunning() {
    setState(() {
      _isRunning = !_isRunning;
      if (_isRunning) {
        _ticker.start();
      } else {
        _ticker.stop();
        _previouslyElapsedTime += _currentlyElapsedTime;
        _currentlyElapsedTime = Duration.zero;
      }
    });
  }

  void _reset() {
    _ticker.stop();
    setState(() {
      _isRunning = false;
      _previouslyElapsedTime = Duration.zero;
      _currentlyElapsedTime = Duration.zero;
    });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final radius = constraints.maxWidth / 2;
        return Stack(
          children: [
            StopwatchRenderer(
              elapsedTime: _elapsedTime,
              radius: radius,
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: SizedBox(
                width: 80,
                height: 80,
                child: ResetButton(
                  onPressed: _reset,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: SizedBox(
                width: 80,
                height: 80,
                child: StartStopButton(
                  isRunning: _isRunning,
                  onPressed: _toggleRunning,
                ),
              ),
            )
          ],
        );
      },
    );
  }
}
