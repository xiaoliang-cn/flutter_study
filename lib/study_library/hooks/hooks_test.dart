import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:xl_flutter/study_library/hooks/timer_hooks.dart';

class HooksTest extends HookWidget {
  const HooksTest({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var sendCode = false;
    var num = useTimerHook(
      context,
      10300,
    );

    useEffect(() {
      print("object");
    }, []);
    print(sendCode);
    return Scaffold(
      appBar: AppBar(
        title: Text("HooksTest"),
      ),
      body: Center(
        child: GestureDetector(
            onTap: () {
              num = 100;
            },
            child: Text(num.toString())),
      ),
    );
  }
}
