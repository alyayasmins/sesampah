// ignore_for_file: deprecated_member_use
import 'dart:async';
import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:syncfusion_flutter_signaturepad/signaturepad.dart';
import 'package:path/path.dart';

const directoryName = 'Signature';

class TandaTangan extends StatefulWidget {
  final DocumentSnapshot doc;
  const TandaTangan({Key? key, required this.doc}) : super(key: key);

  @override
  _TandaTanganState createState() => _TandaTanganState();
}

class _TandaTanganState extends State<TandaTangan> {
  final GlobalKey<SfSignaturePadState> signatureGlobalKey = GlobalKey();

  // void initState() {
  //   super.initState();
  //   _requestPermission();
  // }

  // _requestPermission() async {
  //   Map<Permission, PermissionStatus> statuses = await [
  //     Permission.storage,
  //   ].request();
  //   final info = statuses[Permission.storage].toString();
  //   print(info);
  //   _toastInfo(info);
  // }

  void _handleClearButtonPressed() {
    signatureGlobalKey.currentState!.clear();
  }

  void _handleSaveButtonPressed() async {
    final data =
        await signatureGlobalKey.currentState!.toImage(pixelRatio: 3.0);
    final bytes = await data.toByteData(format: ui.ImageByteFormat.png);
    Directory? directory = await getExternalStorageDirectory();
    String path = directory!.path;
    print(path);

// create directory on external storage
    await Directory('$path/$directoryName').create(recursive: true);

// write to storage as a filename.png
    _imageFile = await File('$path/$directoryName/filename.png')
        .writeAsBytes(bytes!.buffer.asInt8List());

    setState(() {});
    await Navigator.of(this.context).push(
      MaterialPageRoute(
        builder: (BuildContext context) {
          return Scaffold(
            appBar: AppBar(
              actions: [
                TextButton(
                  onPressed: () async {
                    String url = await uploadImageToFirebase(context);
                    await FirebaseFirestore.instance
                        .collection('balanceWithdraw')
                        .doc(widget.doc.id)
                        .update({'proof': url, 'status': 'Selesai'});
                    print(widget.doc.id);
                    Navigator.pop(context);
                    Navigator.pop(context);
                    Navigator.pop(context);
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => DetailPenarikanSelesai(
                    //             nominal: '', name: '', id: '', status: '')));
                  },
                  child: Text(
                    'Selesai',
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 18,
                        color: Colors.white),
                  ),
                ),
              ],
              centerTitle: true,
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back),
                color: Colors.white,
              ),
            ),
            body: Center(
              child: Container(
                color: Colors.grey[300],
                child: Image.memory(bytes.buffer.asUint8List()),
              ),
            ),
          );
        },
      ),
    );
  }

  _toastInfo(String info) {
    ScaffoldMessenger.of(this.context).showSnackBar(
      SnackBar(
        content: Text(info),
      ),
    );
  }

  Future<File> writeToFile(ByteData data) async {
    final buffer = data.buffer;
    Directory tempDir = await getTemporaryDirectory();
    String tempPath = tempDir.path;
    var filePath = tempPath + '$_handleSaveButtonPressed';
    return new File(filePath).writeAsBytes(
        buffer.asUint8List(data.offsetInBytes, data.lengthInBytes));
  }

  File? _imageFile;

  final picker = ImagePicker();

  Future pickImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);

    setState(() {
      _imageFile = File(pickedFile!.path);
    });
  }

  Future<String> uploadImageToFirebase(BuildContext context) async {
    String fileName = basename(_imageFile!.path);
    Reference firebaseStorageRef =
        FirebaseStorage.instance.ref().child('sign/$fileName');
    UploadTask uploadTask = firebaseStorageRef.putFile(_imageFile!);
    TaskSnapshot taskSnapshot = await uploadTask;
    String urlDownload = await taskSnapshot.ref.getDownloadURL();
    return urlDownload;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.all(10),
            child: Container(
              child: SfSignaturePad(
                  key: signatureGlobalKey,
                  backgroundColor: Colors.white,
                  strokeColor: Colors.black,
                  minimumStrokeWidth: 3.0,
                  maximumStrokeWidth: 6.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
              ),
            ),
          ),
          SizedBox(height: 10),
          Row(children: <Widget>[
            TextButton(
              child: Text(
                'Simpan',
                style: TextStyle(fontSize: 16, fontFamily: 'Poppins'),
              ),
              onPressed: _handleSaveButtonPressed,
            ),
            TextButton(
              child: Text(
                'Hapus',
                style: TextStyle(fontSize: 16, fontFamily: 'Poppins'),
              ),
              onPressed: _handleClearButtonPressed,
            )
          ], mainAxisAlignment: MainAxisAlignment.spaceEvenly)
        ],
      ),
    );
  }

  Widget uploadImageButton(BuildContext context) {
    return Container(
      child: Stack(
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(15),
            child: SizedBox(
              height: 60,
              width: 388,
              child: ElevatedButton(
                onPressed: () => uploadImageToFirebase(context),
                style: ElevatedButton.styleFrom(
                  primary: const Color(0xFF375969),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
                child: const Text(
                  "Kirim",
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 16,
                      fontWeight: FontWeight.w700),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
