// ignore_for_file: deprecated_member_use

import 'dart:io';
import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:sesampah/operator/Status%20Sampah/status.dart';
import 'package:sesampah/operator/Status%20Sampah/status/detail/dSSelesai.dart';
import 'package:sesampah/operator/Status%20Sampah/status/statusSelesai.dart';

class Timbangan extends StatefulWidget {
  final String docId;
  final String userId;
  final String fullName;
  final String delivery;
  final List trashes;

  Timbangan({
    required this.docId,
    required this.userId,
    required this.fullName,
    required this.delivery,
    required this.trashes,
  });

  @override
  _TimbanganState createState() => _TimbanganState();
}

class _TimbanganState extends State<Timbangan> {
  File? _imageFile;

  final picker = ImagePicker();

  Future pickImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);

    setState(() {
      _imageFile = File(pickedFile!.path);
    });
  }

  Future<String?> uploadImageToFirebase(BuildContext context) async {
    String fileName = basename(_imageFile!.path);
    Reference firebaseStorageRef =
        FirebaseStorage.instance.ref().child('uploads/$fileName');
    UploadTask uploadTask = firebaseStorageRef.putFile(_imageFile!);
    TaskSnapshot taskSnapshot = await uploadTask;
    String urlDownload = await taskSnapshot.ref.getDownloadURL();
    return urlDownload;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "Detail",
          style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Colors.black),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => StatusSampah()));
          },
          icon: const Icon(Icons.arrow_back),
          color: Colors.black,
        ),
      ),
      body: ListView(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Nama Pengguna",
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          widget.fullName,
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Pengantaran",
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          widget.delivery,
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      "Pesanan",
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 16,
                      ),
                    ),
                    Column(
                      children: List.generate(widget.trashes.length, (index) {
                        widget.trashes[index]['weight'] = 0;
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              widget.trashes[index]['subCategory'],
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 16,
                                color: Color(0xFF6FB2D2),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              widget.trashes[index]['price'].toString() + '/kg',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 16,
                                color: Color(0xFF6FB2D2),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        );
                      }),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Status",
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          "Sampah Telah Ditimbang",
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF43936C)),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      "Berat",
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Column(
                      children: List.generate(
                        widget.trashes.length,
                        (i) => Container(
                          margin: EdgeInsets.only(bottom: 8),
                          child: TextField(
                            keyboardType: TextInputType.number,
                            onChanged: (value) =>
                                widget.trashes[i]['weight'] = int.parse(value),
                            onSubmitted: (value) =>
                                widget.trashes[i]['weight'] = int.parse(value),
                            decoration: InputDecoration(
                              hintText:
                                  "Masukkan Berat ${widget.trashes[i]['subCategory']}",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    // SizedBox(
                    //   height: 8,
                    // ),
                    // Text(
                    //   "Harga /kg",
                    //   style: TextStyle(
                    //     fontFamily: 'Poppins',
                    //     fontSize: 16,
                    //   ),
                    // ),
                    // SizedBox(
                    //   height: 8,
                    // ),
                    // TextFormField(
                    //   decoration: InputDecoration(
                    //     hintText: "Masukkan Harga /kg",
                    //     border: OutlineInputBorder(
                    //       borderRadius: BorderRadius.circular(10),
                    //     ),
                    //   ),
                    // ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      "Biaya Admin : Rp.500",
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 16,
                      ),
                    ),
                    // SizedBox(
                    //   height: 10,
                    // ),
                    // Text(
                    //   "Bukti",
                    //   style: TextStyle(
                    //       fontFamily: 'Poppins',
                    //       fontSize: 18,
                    //       fontWeight: FontWeight.bold),
                    // ),
                    // SizedBox(
                    //   height: 8,
                    // ),
                    // Center(
                    //   child: Column(
                    //     mainAxisAlignment: MainAxisAlignment.center,
                    //     children: [
                    //       Container(
                    //         margin: const EdgeInsets.only(
                    //             left: 30.0, right: 30.0, top: 10.0),
                    //         child: _imageFile != null
                    //             ? Image.file(_imageFile!)
                    //             : IconButton(
                    //                 icon: Icon(
                    //                   Icons.add_a_photo,
                    //                   size: 40,
                    //                 ),
                    //                 onPressed: pickImage,
                    //               ),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    uploadImageButton(context, widget.trashes),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget uploadImageButton(BuildContext context, List trashes) {
    return Container(
      child: Stack(
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(15),
            child: SizedBox(
              height: 60,
              width: 388,
              child: ElevatedButton(
                onPressed: () {
                  num result = 0;

                  showDialog(
                    context: context,
                    builder: (_) => AlertDialog(
                      title: Text('Konfirmasi'),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ...List.generate(trashes.length, (i) {
                            result = result +
                                trashes[i]['price'] * trashes[i]['weight'];
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(trashes[i]['subCategory'] +
                                    ' - ' +
                                    trashes[i]['weight'].toString() +
                                    'Kg'),
                                Text('Rp. ' +
                                    (trashes[i]['price'] * trashes[i]['weight'])
                                        .toString())
                              ],
                            );
                          }).toList(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [Text('Total'), Text('Rp. $result')],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [Text('Biaya Admin'), Text('Rp. 500')],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Jumlah'),
                              Text('Rp. ' + (result - 500).toString())
                            ],
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            child: ElevatedButton(
                              onPressed: () async {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => StatusSelesai()));
                                // String? url =
                                //     await uploadImageToFirebase(context);

                                await FirebaseFirestore.instance
                                    .collection('swapTrashes')
                                    .doc(widget.docId)
                                    .update(
                                  {
                                    'status': "Selesai",
                                    // 'proof': url,
                                  },
                                );

                                await FirebaseFirestore.instance
                                    .collection('users')
                                    .doc(widget.userId)
                                    .update(
                                  {
                                    'balance': FieldValue.increment(result),
                                  },
                                );

                                Navigator.of(context)
                                  ..pop()
                                  ..pop()
                                  ..pop()
                                  ..pop();
                              },
                              child: Text('Terima'),
                              style: ElevatedButton.styleFrom(
                                primary: const Color(0xFF375969),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
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
