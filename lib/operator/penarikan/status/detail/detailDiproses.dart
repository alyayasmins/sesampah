import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sesampah/operator/penarikan/status/detail/tandaTangan.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DetailPenarikanDiproses extends StatefulWidget {
  final String nominal;
  final String id;
  final String fullName;
  DocumentSnapshot doc;

  DetailPenarikanDiproses({
    Key? key,
    required this.nominal,
    required this.id,
    required this.fullName,
    required this.doc,
  }) : super(key: key);

  @override
  State<DetailPenarikanDiproses> createState() =>
      _DetailPenarikanDiprosesState();
}

class _DetailPenarikanDiprosesState extends State<DetailPenarikanDiproses> {
  static var today = new DateTime.now();
  var formatedTanggal = new DateFormat.yMMMd().format(today);
  void initState() {
    // TODO: implement initState
    userData();
    super.initState();
  }

  userData() async {
    SharedPreferences shared = await SharedPreferences.getInstance();
    uid = await shared.getString('uid');
    // print(uid);
    // await FirebaseFirestore.instance.collection('users').doc(uid).get().then(
    //   (doc) {
    //     setState(() {
    //       fullName = doc["fullName"];
    //     });
    //   },
    // );
  }

  String? uid;
  // String? fullName;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance
            .collection('balanceWithdraw')
            .doc(widget.doc.id)
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
                  Expanded(
                    flex: 10,
                    child: (Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          margin: EdgeInsets.all(20),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Tanggal Penarikan",
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 16,
                                    ),
                                  ),
                                  Text(
                                    formatedTanggal.toString(),
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Status",
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 16,
                                    ),
                                  ),
                                  Text(
                                    "Uang akan diantar",
                                    style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFF43936C)),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    )),
                  ),
                  Expanded(
                    flex: 10,
                    child: Container(
                      margin: EdgeInsets.all(15),
                      child: SizedBox(
                        height: 60,
                        width: 388,
                        child: ElevatedButton(
                          onPressed: () {
                            // FirebaseFirestore.instance
                            //     .collection('balanceWithdraw')
                            //     .doc(widget.id)
                            //     .update(
                            //   {'status': "Selesai"},
                            // );
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => TandaTangan(
                                          doc: snapshot.data!,
                                          nominal: int.parse(widget.nominal),
                                        )));
                          },
                          style: ElevatedButton.styleFrom(
                            primary: const Color(0xFF375969),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                          ),
                          child: const Text(
                            "Lanjut",
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 16,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
          return Text("Loading");
        });
  }
}
