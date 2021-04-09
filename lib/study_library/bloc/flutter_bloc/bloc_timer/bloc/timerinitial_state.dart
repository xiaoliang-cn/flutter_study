part of 'timerinitial_bloc.dart';

///我们的TimerBloc状态可以是以下之一：
/// —准备从指定的持续时间开始递减计数。TimerInitial
///TimerRunInProgress-从指定持续时间开始递减计数。
///TimerRunPause-在某些剩余时间暂停。
///TimerRunComplete —已完成，剩余持续时间为0。
///这些状态中的每一个都会对用户看到的内容产生影响。例如：
///如果状态为TimerInitial用户，则用户将能够启动计时器。
///如果状态为TimerRunInProgress用户，则用户将能够暂停和重置计时器以及查看剩余时间。
///如果状态为TimerRunPause用户，则用户将能够恢复计时器并重置计时器。
///如果状态为TimerRunComplete“用户”，则可以重置计时器。
///为了将所有bloc文件保持在一起，让我们使用创建一个bloc目录bloc/timer_state.dart。
abstract class TimerinitialState extends Equatable {
  final int duration;

  const TimerinitialState(this.duration);
  @override
  List<Object> get props => [duration];
}

class TimerInitial extends TimerinitialState {
  const TimerInitial(int duration) : super(duration);
  @override
  String toString() => 'TimerInitial { duration: $duration }';
}

class TimerRunPause extends TimerinitialState {
  const TimerRunPause(int duration) : super(duration);

  @override
  String toString() => 'TimerRunPause { duration: $duration }';
}

class TimerRunInProgress extends TimerinitialState {
  const TimerRunInProgress(int duration) : super(duration);

  @override
  String toString() => 'TimerRunInProgress { duration: $duration }';
}

class TimerRunComplete extends TimerinitialState {
  const TimerRunComplete() : super(0);
}
