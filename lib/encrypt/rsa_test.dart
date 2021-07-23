import 'dart:convert';

import 'package:encrypt/encrypt_io.dart';
import 'package:flutter/material.dart';
import 'package:encrypt/encrypt.dart';
import 'package:flutter/services.dart';
import 'package:pointycastle/asymmetric/api.dart';

class RASTest extends StatefulWidget {
  @override
  _RASTestState createState() => _RASTestState();
}

class _RASTestState extends State<RASTest> {
  late RSAPublicKey _publicKey;
  late RSAPrivateKey _privateKey;
  late Encrypter _encrypter;
  String _base16 = '';
  String _base64 = '';
  List<int> _bytes = [];
  String _decrypted = '';
  String _a = '';
  String _b = '';
  TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    loadKey();
  }

  void loadKey() async {
    _a = await rootBundle.loadString("assets/test_public_key.pem");
    _b = await rootBundle.loadString("assets/test_private_key.pem");

    _publicKey = RSAKeyParser().parse(_a) as RSAPublicKey;
    _privateKey = RSAKeyParser().parse(_b) as RSAPrivateKey;
    _encrypter = Encrypter(RSA(privateKey: _privateKey, publicKey: _publicKey));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("RSA"),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              TextField(controller: _controller),
              ElevatedButton(
                child: Text("加密"),
                onPressed: () {
                  final encrypted = _encrypter.encrypt(_controller.text);

                  _decrypted = _encrypter.decrypt(encrypted);

                  _bytes = encrypted.bytes;
                  _base16 = encrypted.base16;
                  _base64 = encrypted.base64;
                  setState(() {});
                },
              ),
               Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('原文：  '),
                  Expanded(
                      child:
                          Text(_decrypted, style: TextStyle(color: Colors.red)))
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('公钥： '),
                  Expanded(
                      child:
                          Text(_a, style: TextStyle(color: Colors.red)))
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('私钥：  '),
                  Expanded(
                      child:
                          Text(_b, style: TextStyle(color: Colors.red)))
                ],
              ),
             
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('base16： '),
                  Expanded(
                      child: Text(_base16, style: TextStyle(color: Colors.red)))
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('base64： '),
                  Expanded(
                      child:
                          Text(_base64, style: TextStyle(color: Colors.green)))
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('base16： '),
                  Expanded(
                      child: Text(
                    _bytes.toString(),
                    style: TextStyle(color: Colors.blue),
                  ))
                ],
              )
            ],
          ),
        ));
  }
}
