import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:translator/translator.dart';

class TranSlatorTest extends StatefulWidget {
  @override
  _TranSlatorTestState createState() => _TranSlatorTestState();
}

class _TranSlatorTestState extends State<TranSlatorTest> {
  final translator = GoogleTranslator();
  RxString afterTranslatorContent = ''.obs;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TranSlatorTest'),
        elevation: 0.0,
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("输入英文:"),
                    Expanded(
                      child: TextField(
                        onSubmitted: (data) {
                          translator
                              .translate(data, to: 'zh-cn')
                              .then((result) {
                            afterTranslatorContent.value =
                                "Source: $data\nTranslated: $result";
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Obx(() => Text(afterTranslatorContent.string))
            ],
          ),
        ),
      ),
    );
  }

  void init() async {
    final input = "Здравствуйте. Ты в порядке?";

    // Using the Future API
    translator
        .translate(input, to: 'en')
        .then((result) => print("Source: $input\nTranslated: $result"));

    // Passing the translation to a variable
    var translation = await translator
        .translate("I would buy a car, if I had money.", from: 'en', to: 'it');

    // You can also call the extension method directly on the input
    print('Translated: ${await input.translate(to: 'en')}');

    // For countries that default base URL doesn't work
    translator.baseUrl = "translate.google.cn";
    translator.translateAndPrint("This means 'testing' in chinese",
        to: 'zh-cn');
    //prints 这意味着用中文'测试'

    print("translation: $translation");
    // prints translation: Vorrei comprare una macchina, se avessi i soldi.}
  }
}
