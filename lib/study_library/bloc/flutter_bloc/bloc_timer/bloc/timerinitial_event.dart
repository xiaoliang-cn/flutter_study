part of 'timerinitial_bloc.dart';

//TimerStarted —通知TimerBloc计时器应该启动。
//TimerPaused —通知TimerBloc计时器应暂停。
//TimerResumed —通知TimerBloc应该恢复计时器。
//TimerReset —通知TimerBloc应将计时器重置为原始状态。
//TimerTicked —通知TimerBloc已发生滴答，并且需要相应地更新其状态。
abstract class TimerEvent extends Equatable {
  const TimerEvent();

  @override
  List<Object> get props => [];
}

class TimerStarted extends TimerEvent {
  final int duration;

  const TimerStarted({required this.duration});

  @override
  String toString() => "TimerStarted { duration: $duration }";
}

class TimerPaused extends TimerEvent {}

class TimerResumed extends TimerEvent {}

class TimerReset extends TimerEvent {}

class TimerTicked extends TimerEvent {
  final int duration;

  const TimerTicked({required this.duration});

  @override
  List<Object> get props => [duration];

  @override
  String toString() => "TimerTicked { duration: $duration }";
}
