import 'dart:io';
import 'dart:typed_data';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart' as path;
import 'package:encrypt/encrypt.dart' as enc;
import 'package:permission_handler/permission_handler.dart';
import 'package:url_launcher/url_launcher.dart';

//加密文件
class EncryptFile extends StatefulWidget {
  EncryptFile({Key? key}) : super(key: key);

  @override
  _EncryptFileState createState() => _EncryptFileState();
}

class _EncryptFileState extends State<EncryptFile> {
  // String _videoURL =
  //     "https://assets.mixkit.co/videos/preview/mixkit-clouds-and-blue-sky-2408-large.mp4";
  String _imageURL =
      "https://images.unsplash.com/photo-1607753724987-7277196eac5d?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&dl=jeremy-bishop-FlR9yw3QEgw-unsplash.jpg&w=1920";
  // String _pdfURL = "https://www.irjet.net/archives/V5/i3/IRJET-V5I3124.pdf";
  // String _zipURL = "https://www.1001freefonts.com/d/4063/admiration-pains.zip";
  late Directory _d;
  String? imagePath;
  File? file;
  @override
  void initState() {
    super.initState();
    initData();
    getPathImage();
  }

  void getPathImage() async {
    path.getExternalStorageDirectory().then((value) async {
      file = File(value!.path + '/abc.png');
      if (!file!.existsSync()) {
        var a = await _readData(value.path + '/abc.png.aes');
        var b = _decryptData(a);
        File(value.path + '/abc.png.aes').delete();
        file = File(value.path + '/abc.png')..writeAsBytes(b);
        if (!(await file!.exists())) file!.create();
        // var c = Utf8Encoder().convert(b);
        // print(c);
      }
      setState(() {});
    });
  }

  void initData() async {
    path.getExternalStorageDirectory().then(
          (value) => _d = value!,
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('加密文件'),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
                onPressed: () async {
                  _downloadAndCreate(_imageURL, _d, 'abc.png');
                },
                child: Text("下载文件")),
            Image.file(
              file == null ? File('') : file!,
              fit: BoxFit.fill,
            )
          ],
        ),
      ),
    );
  }

  requestStoragePermission() async {
    if (!await Permission.storage.isGranted) {
      PermissionStatus result = await Permission.storage.request();
      if (result.isGranted) {
        setState(() {});
      } else {
        setState(() {});
      }
    }
  }

  _downloadAndCreate(String url, Directory d, filename) async {
    if (await canLaunch(url)) {
      print("Data downloading....");
      var resp = await http.get(Uri.parse(url));

      var encResult = _encryptData(resp.bodyBytes);
      String p = await _writeData(encResult, d.path + '/$filename.aes');
      // String p = await _writeData(encResult, '/storage/emulated/0/MyEncFolder/demo.mp4.aes');
      print("file encrypted successfully: $p");
    } else {
      print("Can't launch URL.");
    }
  }

  Uint8List _encryptData(plainString) {
    print("Encrypting File...");
    final encrypted =
        MyEncrypt.myEncrypter.encryptBytes(plainString, iv: MyEncrypt.myIv);
    return encrypted.bytes;
  }

  List<int> _decryptData(encData) {
    print("File decryption in progress...");
    var en = new enc.Encrypted(encData);
    return MyEncrypt.myEncrypter.decryptBytes(en, iv: MyEncrypt.myIv);
  }

  Future<Uint8List> _readData(fileNameWithPath) async {
    print("Reading data...");
    File f = File(fileNameWithPath);
    return await f.readAsBytes();
  }

  Future<String> _writeData(dataToWrite, fileNameWithPath) async {
    print("Writting Data...");
    File f = File(fileNameWithPath);
    await f.writeAsBytes(dataToWrite);
    return f.absolute.toString();
  }
}

class MyEncrypt {
  static final myKey = enc.Key.fromUtf8('TechWithVPTechWithVPTechWithVP12');
  static final myIv = enc.IV.fromUtf8("VivekPanchal1122");
  static final myEncrypter = enc.Encrypter(enc.AES(myKey));
}
