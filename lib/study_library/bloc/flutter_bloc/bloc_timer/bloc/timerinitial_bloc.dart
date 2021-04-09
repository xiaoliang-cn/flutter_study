import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:xl_flutter/study_library/bloc/flutter_bloc/bloc_timer/ticker.dart';

part 'timerinitial_event.dart';
part 'timerinitial_state.dart';

class TimerBloc extends Bloc<TimerEvent, TimerinitialState> {
  static const int _duration = 60;

  StreamSubscription<int>? _tickerSubscription;

  final Ticker _ticker;
  TimerBloc({required Ticker ticker})
      : this._ticker = ticker,
        super(TimerInitial(_duration));

  @override
  void onTransition(Transition<TimerEvent, TimerinitialState> transition) {
    print(transition);
    super.onTransition(transition);
  }

  @override
  Stream<TimerinitialState> mapEventToState(TimerEvent event) async* {
    print("mapEventToState=" + event.toString());
    if (event is TimerStarted) {
      yield* _mapTimerStartedToState(event);
    } else if (event is TimerPaused) {
      yield* _mapTimerPausedToState(event);
    } else if (event is TimerResumed) {
      yield* _mapTimerResumedToState(event);
    } else if (event is TimerReset) {
      yield* _mapTimerResetToState(event);
    } else if (event is TimerTicked) {
      yield* _mapTimerTickedToState(event);
    }
  }

  @override
  Future<void> close() {
    _tickerSubscription?.cancel();
    return super.close();
  }

  ///如果TimerBloc接收到TimerStarted事件
  ///，它将推送TimerRunInProgress具有开始持续时间的状态。
  ///另外，如果已经有一个开放空间，_tickerSubscription我们需要取消它以释放内存
  ///。我们还需要重写close我们的方法，
  ///TimerBloc以便我们可以_tickerSubscription在TimerBloc关闭时取消
  ///。最后，我们收听信息_ticker.tick流，
  ///并在每个滴答声中添加一个TimerTicked带有剩余持续时间的事件。
  ///接下来，让我们实现TimerTicked事件处理程序。
  Stream<TimerinitialState> _mapTimerStartedToState(TimerStarted start) async* {
    print("_mapTimerStartedToState");
    yield TimerRunInProgress(start.duration);
    _tickerSubscription?.cancel();
    _tickerSubscription =
        _ticker.tick(ticks: start.duration).listen((duration) =>
            // print("~~~$duration");
            add(TimerTicked(duration: duration)));
  }

  ///每次TimerTicked接收到一个事件时，如果滴答声的持续时间大于0，
  ///则需要TimerRunInProgress使用新的持续时间推送更新后的状态。
  ///否则，如果订单号的持续时间为0，则我们的计时器已结束，
  ///我们需要推送TimerRunComplete状态。
  Stream<TimerinitialState> _mapTimerTickedToState(TimerTicked tick) async* {
    print("-----_mapTimerTickedToState---");
    yield tick.duration > 0
        ? TimerRunInProgress(tick.duration)
        : TimerRunComplete();
  }

  ///在_mapTimerPausedToState如果state我们的TimerBloc就是TimerRunInProgress，
  ///我们可以暂停_tickerSubscription和推TimerRunPause状态与当前定时器持续时间。
  Stream<TimerinitialState> _mapTimerPausedToState(TimerPaused paused) async* {
    if (state is TimerRunInProgress) {
      _tickerSubscription?.pause();
      yield TimerRunPause(state.duration);
    }
  }

  ///该TimerResumed事件处理是非常相似的TimerPaused事件处理程序。
  ///如果TimerBloc具有的stateofTimerRunPause且它接收到一个TimerResumed事件，
  ///则它将恢复_tickerSubscription并推送TimerRunInProgress具有当前持续时间的状态。
  Stream<TimerinitialState> _mapTimerResumedToState(TimerResumed event) async* {
    if (state is TimerRunPause) {
      _tickerSubscription?.resume();
      yield TimerRunInProgress(state.duration);
    }
  }

  ///如果TimerBloc接收到TimerReset事件，
  ///则需要取消当前事件，_tickerSubscription以便不通知任何其他滴答
  ///，并TimerInitial以原始持续时间推送状态。
  Stream<TimerinitialState> _mapTimerResetToState(TimerReset event) async* {
    _tickerSubscription?.cancel();
    yield TimerInitial(_duration);
  }
}
