import 'dart:async';

main(List<String> args) {
  listenWithPause();
}

Stream<int> timedCounter(Duration interval, [int? maxCount]) {
  StreamController<int>? controller;
  Timer? timer;
  int counter = 0;

  void tick(_) {
    counter++;
    controller!.add(counter); // Ask stream to send counter values as event.
    if (counter == maxCount) {
      timer!.cancel();
      controller.close(); // Ask stream to shut down and tell listeners.
    }
  }

  void startTimer() {
    timer = Timer.periodic(interval, tick);
  }

  void stopTimer() {
    if (timer != null) {
      timer!.cancel();
      timer = null;
    }
  }

  controller = StreamController<int>(
      onListen: startTimer,
      onPause: stopTimer,
      onResume: startTimer,
      onCancel: stopTimer);

  return controller.stream;
}

void listenAfterDelay() async {
  var counterStream = timedCounter(const Duration(seconds: 1), 15);
  await Future.delayed(const Duration(seconds: 5));

  // After 5 seconds, add a listener.
  await for (int n in counterStream) {
    print(n); // Print an integer every second, 15 times.
  }
}
// Stream<int> timedCounter(Duration interval, [int? maxCount]) async* {
//   int i = 0;
//   while (true) {
//     await Future.delayed(interval);
//     yield i++;
//     if (i == maxCount) break;
//   }
// }

// NOTE: This implementation is FLAWED!
// It starts before it has subscribers, and it doesn't implement pause.
// Stream<int> timedCounter(Duration interval, [int? maxCount]) {
//   var controller = StreamController<int>();
//   int counter = 0;
//   void tick(Timer timer) {
//     counter++;
//     controller.add(counter); // Ask stream to send counter values as event.
//     if (maxCount != null && counter >= maxCount) {
//       timer.cancel();
//       controller.close(); // Ask stream to shut down and tell listeners.
//     }
//   }

//   Timer.periodic(interval, tick); // BAD: Starts before it has subscribers.
//   return controller.stream;
// }

void listenWithPause() {
  var counterStream = timedCounter(const Duration(seconds: 1), 15);
  StreamSubscription<int>? subscription;

  subscription = counterStream.listen((int counter) {
    print(counter); // Print an integer every second.
    if (counter == 5) {
      subscription?.cancel();
      // After 5 ticks, pause for five seconds, then resume.
      subscription!.pause(Future.delayed(Duration(seconds: 3), () {
        subscription!.resume();
      }));
    }
  });
}

/// Splits a stream of consecutive strings into lines.
///
/// The input string is provided in smaller chunks through
/// the `source` stream.
Stream<String> lines(Stream<String> source) async* {
  // Stores any partial line from the previous chunk.
  var partial = '';
  // Wait until a new chunk is available, then process it.
  await for (var chunk in source) {
    var lines = chunk.split('\n');
    lines[0] = partial + lines[0]; // Prepend partial line.
    partial = lines.removeLast(); // Remove new partial line.
    for (var line in lines) {
      yield line; // Add lines to output stream.
    }
  }
  // Add final partial line to output stream, if any.
  if (partial.isNotEmpty) yield partial;
}
