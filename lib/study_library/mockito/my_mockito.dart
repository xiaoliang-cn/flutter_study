import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';

class DownloadItem {
  List<String>? fetchAllDownloadItem() =>
      ['1', '2', '3', '4', '5', '6', '7', '8'];
  bool? eatFood(String? food, {bool? hungry}) => true;
  Future<void> chew() async => print('Chewing...');
  int? walk(List<String>? places) => 7;
  void sleep() {}
  void hunt(String? place, String? prey) {}
  int lives = 9;
  String? sound() => 'Meow';
}

class MockDownload extends Mock implements DownloadItem {}

main(List<String> args) {
  late DownloadItem downloadItem;
  setUp(() {
    downloadItem = MockDownload();
  });
  test('fetch all download item', () {
    downloadItem.fetchAllDownloadItem();
    verify(downloadItem.fetchAllDownloadItem());
  });

  test('how about some stubbing?', () {
    expect(downloadItem.fetchAllDownloadItem(), null);
    // downloadItem.fetchAllDownloadItem();
    // verify(downloadItem.fetchAllDownloadItem());
    //
    //   // Stub a method before interacting with it.
    when(downloadItem.sound()).thenReturn('Purr');
    expect(downloadItem.sound(), 'Purr');

    // Let's change the stub.
    when(downloadItem.sound()).thenReturn('Meow');
    expect(downloadItem.sound(), 'Meow');

    // You can stub getters.
    when(downloadItem.lives).thenReturn(9);
    // expect(downloadItem.lives, 2);

    // You can stub a method to throw.
    // when(downloadItem.lives).thenThrow(RangeError('Boo'));
    // expect(() => downloadItem.lives, throwsRangeError);

    // // We can calculate a response at call time.
    // var responses = ['Purr', 'Meow'];
    // when(downloadItem.sound()).thenAnswer((_) => responses.removeAt(0));
    // expect(downloadItem.sound(), 'Purr');
    // expect(downloadItem.sound(), 'Meow');
  });
}
