import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sesampah/operator/penarikan/status/detail/print_data.dart';
import 'package:printing/printing.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'print_data.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class DetailPenarikanSelesai extends StatefulWidget {
  final String nominal;

  final String status;
  final String id;
  DocumentSnapshot? doc;
  DetailPenarikanSelesai(
      {Key? key,
      required this.nominal,
      required this.id,
      required this.status,
      required this.doc})
      : super(key: key);

  @override
  State<DetailPenarikanSelesai> createState() => _DetailPenarikanSelesaiState();
}

class _DetailPenarikanSelesaiState extends State<DetailPenarikanSelesai> {
  void initState() {
    // TODO: implement initState
    userData();
    super.initState();
  }

  userData() async {
    SharedPreferences shared = await SharedPreferences.getInstance();
    uid = await shared.getString('uid');
    print(uid);
    await FirebaseFirestore.instance.collection('users').doc(uid).get().then(
      (doc) {
        setState(() {
          fullName = doc["fullName"];
        });
      },
    );
  }

  String? uid;
  String? fullName;

  static var today = new DateTime.now();
  var formatedTanggal = new DateFormat.yMMMd().format(today);
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DocumentSnapshot>(
      stream: FirebaseFirestore.instance
          .collection('balanceWithdraw')
          .doc(widget.doc!.id)
          .snapshots(),
      builder: (_, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasData) {
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
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back),
                color: Colors.black,
              ),
            ),
            body: ListView(
              children: [
                Container(
                  margin: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 30,
                            width: 90,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Color(0xFF6FB2D2),
                            ),
                            child: Center(
                              child: Text(
                                widget.status,
                                style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              printDoc();
                            },
                            icon: Icon(
                              Icons.print,
                              size: 30,
                              color: Color(0xFF6FB2D2),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),

                      SizedBox(
                        height: 8,
                      ),
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
                            fullName.toString(),
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
                            "Nominal Penarikan",
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            widget.nominal,
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
                            "Status Penarikan",
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            "Selesai melakukan penarikan",
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF43936C),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        'Bukti',
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                      Image.network(snapshot.data!.get('proof'))
                      // Container(
                      //   margin: EdgeInsets.all(15),
                      //   child: SizedBox(
                      //     height: 60,
                      //     width: 388,
                      //     child: ElevatedButton(
                      //       onPressed: () {},
                      //       style: ElevatedButton.styleFrom(
                      //         primary: const Color(0xFF375969),
                      //         shape: RoundedRectangleBorder(
                      //             borderRadius: BorderRadius.circular(10)),
                      //       ),
                      //       child: const Text(
                      //         "Selesai",
                      //         style: TextStyle(
                      //             fontFamily: 'Poppins',
                      //             fontSize: 16,
                      //             fontWeight: FontWeight.w700),
                      //       ),
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }
        return Text("Loading");
      },
    );
  }

  Future<void> printDoc() async {
    final doc = pw.Document();
    doc.addPage(pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return buildPrintableData(doc);
        }));
    await Printing.layoutPdf(
        onLayout: (PdfPageFormat format) async => doc.save());
  }
}
