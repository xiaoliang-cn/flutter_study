import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xl_flutter/study_library/bloc/flutter_bloc/bloc_timer/bloc/timerinitial_bloc.dart';
import 'package:xl_flutter/study_library/bloc/flutter_bloc/bloc_timer/ticker.dart';

import 'bloc/timer.dart';

class BlocTickerTest extends StatefulWidget {
  @override
  _BlocTickerTestState createState() => _BlocTickerTestState();
}

class _BlocTickerTestState extends State<BlocTickerTest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BlocTickerTest'),
        elevation: 0.0,
      ),
      body: BlocProvider(
        create: (context) => TimerBloc(ticker: Ticker()),
        child: Timer(),
      ),
    );
  }
}
