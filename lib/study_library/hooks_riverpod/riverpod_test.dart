import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final numberProvider1 = Provider<int>((ref) => 1);

///```dart
///  Widget build(BuildContext context, watch) {
///        logger.d("message");
///        watch(numberProvider2).state;
///  }
///
///```
final numberProvider2 = StateProvider<int>((ref) => 1);

///```dart
///var future = watch(futureNumber);
///     body: Center(
///         child: future.when(
///            data: (value) => Text(value.toString()),
///            loading: () => CircularProgressIndicator(),
///            error: (e, stace) => Text(e.toString()))),
///```
final futureNumber = FutureProvider.autoDispose<int>((ref) async {
  await Future.delayed(Duration(seconds: 3));
  throw ('------');
});

///countStream.when(
///   data: (value) => Text(value.toString()),
/// loading: () => CircularProgressIndicator(),
/// error: (e, stace) => Text(e.toString()))),

final countStreamProvider = StreamProvider.autoDispose<String>(
    (ref) => Stream.periodic(Duration(milliseconds: 400), (count) => '$count'));

class RiverpodTest extends ConsumerWidget {
  @override
  Widget build(BuildContext context, watch) {
    // logger.d("message");
    var countStream = watch(countStreamProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text('RiverpodTest'),
        elevation: 0.0,
      ),
      body: Center(
          child: countStream.when(
              data: (value) => Text(value.toString()),
              loading: () => CircularProgressIndicator(),
              error: (e, stace) => Text(e.toString()))),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read(numberProvider2).state++;
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
