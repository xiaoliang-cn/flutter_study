import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:logger/logger.dart';

int useTimerHook(BuildContext context, milliseconds) {
  return use(_TimerTaskHook(duration: Duration(milliseconds: milliseconds)));
}

class _TimerTaskHook extends Hook<int> {
  final Duration duration;
  const _TimerTaskHook({required this.duration});
  @override
  HookState<int, Hook<int>> createState() => _TimerTaskHookState();
}

class _TimerTaskHookState extends HookState<int, _TimerTaskHook> {
  Timer? _timer;
  int _time = 60;
  @override
  void initHook() {
    super.initHook();
    if (_timer == null) {
      _timer = Timer.periodic(hook.duration, (timer) {
        setState(() {
          _time--;
        });
      });
    }
  }

  @override
  void dispose() {
    Logger().d("message");
    super.dispose();
    _timer?.cancel();
    _timer = null;
  }

  @override
  int build(BuildContext context) {
    return _time;
  }
}
