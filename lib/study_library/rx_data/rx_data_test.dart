import 'dart:async';
import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:supercharged/supercharged.dart';
import 'package:rxdart/streams.dart';

// ignore: must_be_immutable
class RxDataTest extends StatelessWidget {
  void concatStream() {
    // 只要先前的流序列成功终止，就连接所有指定的流序列。
    // 它通过逐个订阅每个流，发出所有项目并在订阅下一个流之前完成来完成此操作。
    // 如果提供的流为空，则生成的序列将立即完成而不会发出任何项目。
    ConcatStream<String>([
      Stream.fromIterable(['a']),
      //延迟执行
      TimerStream('b', 3.seconds),
      Stream.fromIterable(['d'])
    ]).listen(print); // prints 1, 2, 3
    // 快捷写法
    Rx.concat([
      Stream.value(1),
      Rx.timer(2, Duration(seconds: 1)),
      Stream.value(3)
    ]).listen(print); // prints 1, 2, 3
  }

  void concatEagerStream() {
    ConcatEagerStream([
      Stream.fromIterable([1]),
      TimerStream(2, Duration(seconds: 1)),
      Stream.fromIterable([3, 3, 4, 4]),
      TimerStream(3, Duration(seconds: 5)),
      Stream.fromIterable([1, 13, 4, 4]),
    ]).listen(print); // prints 1, 2, 3

    //-----
    Rx.concatEager(
            [Stream.value(1), Rx.timer(2, Duration(days: 1)), Stream.value(3)])
        .listen(print); // prints 1, 2, 3
  }

  Stream? a;
  //延迟工厂等待直到侦听器订阅它，然后它使用给定的工厂功能创建一个Stream。
//在某些情况下，等到最后一分钟（即直到订阅时间）生成Stream可以确保侦听器接收到最新的数据。
//默认情况下，DeferStreams是单预订的。但是，可以使它们可重用。
  void deferStream() async {
    Rx.defer(() => Stream.value(1)).listen(print); //prints 1
    print(a);
    if (a != null) return;
    //重点：是单预订
    a = DeferStream(() => Stream.value([1, 2, 3, 4, 5]));
    await Future.delayed(3.seconds);
    a?.listen((event) {
      print(event);
      a = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    // combineStream();
    // concatStream();
    // concatEagerStream();

    return Scaffold(
      appBar: AppBar(
        title: Text('RxDataTest'),
        elevation: 0.0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // deferStream();
          // forkJoinStream();
          // fromCallableStream();
          // 合并
          // mergeStream();
          // nerverStream();
          // 比较流
          // sequenceEqual();
          // RetryStream(() => Stream.value(1))
          //     .listen((i) => print(i += i)); // Prints 1
          // Prints 1, 1, Instance of 'Error', Instance of 'Error'
          // 重拾流 如果有出现问题就重拾 可以指定次数，如果不指定就无限重试
          // retryStream();
          // 返回一个Stream，该Stream发出指定范围内的整数序列。
          // RangeStream(1, 1111).listen((i) => print(i));
          // rangeStream();

//创建一个流，当通知程序发出新值时，该流将重新创建并重新侦听源流。如果源Stream发出错误或完成，则Stream终止。
//如果retryWhenFactory抛出错误或返回发出错误的Stream，
//则将发出原始错误。然后，
//retryWhenFactory如果源错误与原始错误不同，则将发出错误。
          // retryWhenStream();

          //当有新流的话就取消最近的流
          // switchLatest();
          //当侦听器侦听它时，
          //从资源工厂函数创建资源对象，并从给定工厂函数和资源作为参数创建Stream。最后，
          //当流完成发送项目或取消流订阅时（调用StreamSubscription.cancel或Stream.listen(cancelOnError: true)）
          //，请在资源对象上调用处理程序函数。
          //该UsingStream是你可以指示一个流来创建仅在流的寿命存在且被设置在流终止的资源的方式。
          // using();

          rxDartExt();
        },
      ),
    );
  }

  void rxDartExt() {
    // Stream.fromIterable([1, 2, 3])
    //     .throttleTime(Duration(seconds: 1))
    //     .listen(print); // prints 3

    //创建一个Stream，其中每个项目都是一个List包含源序列中的项目的。
    //这List是发射每次window发射的事件
    // Stream.periodic(Duration(milliseconds: 100), (i) => i)
    //     .buffer(Stream.periodic(Duration(milliseconds: 160), (i) => i))
    //     .listen(print); // prints [0, 1] [2, 3] [4, 5] ...

    //从源Stream缓冲多个值，count然后发出并清除该缓冲，并为每个startBufferEvery值启动一个新的缓冲 。
    //如果startBufferEvery未提供
    //，那么新缓冲区将在源的开头以及每个缓冲区关闭并发出时立即启动。
    //如果startBufferEvery为2，
    //则将对源中的每个其他值启动一个新的缓冲区。默认情况下，新缓冲区在源的开头启动。
    // RangeStream(1, 11)
    //     .bufferCount(1, 2)
    //     .listen(print); // prints [1, 2, 3], [3, 4, 5], [5] done!
    // 在Stream序列上应用累加器函数，并返回每个中间结果。可选的种子值用作初始累加器值。
    //       Stream.fromIterable([1, 2, 3])
    //  .scan((acc, curr, i) => acc + curr, 0)
    //  .listen(print); // prints 1, 3, 6

    // MergeStream([
    //   Stream.fromIterable([1]),
    //   TimerStream(2, Duration(minutes: 2))
    // ])
    //     .skipUntil(TimerStream(true, Duration(minutes: 1)))
    //     .listen(print); // prints 2;
  }

  void using() {
    Rx.using<int, Queue<int>>(
      () => Queue.of([1, 2, 3]),
      (r) => Stream.fromIterable(r),
      (r) => r.clear(),
    ).listen(print); // prints 1, 2, 3
  }

  void switchLatest() {
    final switchLatestStream = SwitchLatestStream<String>(
      Stream.fromIterable(<Stream<String>>[
        Rx.timer('A', Duration(seconds: 0)),
        Rx.timer('B', Duration(seconds: 1)),
        Stream.value('C'),
      ]),
    );

// Since the first two Streams do not emit data for 1-2 seconds, and the
// 3rd Stream will be emitted before that time, only data from the 3rd
// Stream will be emitted to the listener.
    switchLatestStream.listen(print); // prints 'C'
  }

  void retryWhenStream() {
// RetryWhenStream<int>(
    //   () => Stream<int>.fromIterable(<int>[1, 2, 3, 4]),
    //   (Object error, StackTrace s) => throw error,
    // ).listen(print); // Prints 1

    // RetryWhenStream<int>(
    //   () => Stream<int>.periodic(const Duration(seconds: 1), (int i) => i)
    //       .map((int i) => i == 5 ? throw 'exception' : i),
    //   (Object e, StackTrace s) =>
    //       Rx.timer<void>(null, const Duration(milliseconds: 200)),
    // ).take(7).listen(print); // Prints 0, 1, 0, 1
    //
    var errorHappened = false;
    RetryWhenStream<int>(
      () => Stream.periodic(const Duration(seconds: 1), (i) => i).map((i) {
        if (i == 3 && !errorHappened) {
          throw 'We can take this. Please restart.';
        } else if (i == 4) {
          throw 'It\'s enough.';
        } else {
          return i;
        }
      }),
      (e, s) {
        print('-----');
        errorHappened = true;
        if (e == 'We can take this. Please restart.') {
          return Stream.value('Ok. Here you go!');
        } else {
          return Stream.error(e, s);
        }
      },
    ).listen(print, onError: print); // Prints 0, 1, 2, 0, 1, 2, 3, It's enough.
  }

  void rangeStream() {
    // RangeStream(1, 1111).listen((i) => print(i));
    Rx.range(1, 3).listen((i) => print(i)); // Prints 1, 2, 3
    Rx.range(3, 1).listen((i) => print(i)); // Prints 3, 2, 1
  }

  void retryStream() {
    RetryStream(
            () => Stream<Object>.value(3).concatWith([
                  Rx.combineLatest2<String, int, bool>(
                      Rx.timer("ab", 1.seconds), Rx.timer(10, 1.seconds),
                      (String a, int b) {
                    a.toInt();
                    Stream<int>.error(Error());
                    return false;
                  }),
                  Rx.timer(3, 2.seconds),
                  Stream<int>.empty(),
                  Stream<int>.error(Error())
                ]),
            5)
        .listen(
      print,
      onError: (Object e, StackTrace s) => print(e.toString()),
    );
  }

//确定两个流是否发出同一个值
  void sequenceEqual() {
    SequenceEqualStream(Stream.fromIterable([1, 2, 3, 4, 5]),
        Stream.fromIterable([1, 2, 3, 4, 5])).listen(print); // prints true;
    Rx.sequenceEqual(Stream.fromIterable([1, 2, 3, 4, 5]),
        Stream.fromIterable([1, 2, 3, 4, 5, 1])).listen(print); // prints true
  }

  void nerverStream() {
    NeverStream().listen(print); //  Neither prints nor terminates
    Rx.never().listen(print); // Neither prints nor terminates
  }

  //合并流
  void mergeStream() {
    MergeStream([
      TimerStream(1, Duration(seconds: 1)),
      Stream.fromIterable([2])
    ]).listen(print);
    //------
    Rx.merge([Rx.timer(1, Duration(seconds: 1)), Stream.value(2)])
        .listen(print); // prints 2, 1
  }

//返回一个Stream，当侦听该Stream时，它将调用您指定的函数，然后发出从该函数返回的值。
//如果是由于调用可调用函数导致的：
//是未来：当未来完成时，此流将触发一个事件，无论是数据事件还是错误事件，然后以完成事件结束。
//是T：此流发出单个数据事件，然后完成事件。
//默认情况下，FromCallableStream是单预订流。
//但是，可以使它们可重用。
//此Stream实际上等效于由(() async* { yield await callable() }())或创建的Stream (() async* { yield callable(); }())。
  void fromCallableStream() {
    FromCallableStream(() => 'Value').listen(print); // prints Value
    FromCallableStream(() async {
      await Future<void>.delayed(const Duration(seconds: 1));
      return 'Value';
    }).listen(print); // prints Value

    Rx.fromCallable(() => 'Value').listen(print); // prints Value

    Rx.fromCallable(() async {
      await Future<void>.delayed(const Duration(seconds: 1));
      return 'Value';
    }).listen(print); // prints Value
  }

  static Stream<T> fromCallable<T>(FutureOr<T> Function() callable,
          {bool reusable = false}) =>
      FromCallableStream(callable, reusable: reusable);

  ///-------------------
//当您有一组流并且仅关心每个流的最终发射值时，最好使用此运算符。一个常见的用例是，
//如果您希望在页面加载时发出多个请求（或其他事件），并且只希望在收到所有人的响应后才采取措施。
//这样就类似于您使用Future.wait的方式。
//请注意，如果提供给forkJoin的任何内部流发生错误，
//那么如果您没有正确地在内部流中捕获错误，则将丢失所有本来应该已经完成​​的其他流的值。
//如果仅关注所有内部流成功完成，则可以从外部捕获错误。
//还要注意的是，如果您的流排放多个项目，
//并且您担心先前的排放forkJoin不是正确的选择。
//在这些情况下，您最好使用CombineLatest或zip之类的运算符。
//如果提供的流为空，则生成的序列将立即完成，而不会发出任何项目，也不会对组合器函数进行任
  void forkJoinStream() {
    // ForkJoinStream.list<String>([
    //   Stream.fromIterable(['a']),
    //   Stream.fromIterable(['b', '1']),
    //   Stream.fromIterable(['C', 'D', 'e'])
    // ]).listen(print); //prints ['a', 'b', 'D']

//如果您希望将值列表合并到一个新对象中，然后再进行操作
    // CombineLatestStream([
    //   Stream.fromIterable(['a']),
    //   Stream.fromIterable(['b']),
    //   Stream.fromIterable(['C', 'D'])
    // ], (values) => values.last).listen(print); //prints 'D'
//具有特定数量的流的示例
//如果希望将特定数量的流以及每个流的值的正确类型信息组合在一起，请使用 Combine2 - Combine9运算符。
    // ForkJoinStream.combine2(
    //   Stream.fromIterable([1]),
    //   Stream.fromIterable([2, 3]),
    //   (int q, int b) => q + b,
    // ).listen(print); // prints 4
    //
    Rx.forkJoin2(Stream.value(1), Stream.fromIterable([0, 1, 2]),
        (int a, int b) => a + b).listen(print); //prints 3
  }

  //组合流 - 将多个流组合成一个发出
  //combine multi stream to one stream
  void combineStream() {
    CombineLatestStream.list<String>([
      Stream.fromIterable(['a']),
      Stream.fromIterable(['b']),
      Stream.fromIterable(['C', 'D']),
      Stream.fromFuture(rString()),
    ])
        .map((event) => event.join("hello"))
        .delay(1.seconds)
        .listen(print); //prints ['a', 'b', 'C'], ['a', 'b', 'D']
  }

  Future<String> rString() async {
    await Future.delayed(1.seconds);
    return "combineTest";
  }
}
