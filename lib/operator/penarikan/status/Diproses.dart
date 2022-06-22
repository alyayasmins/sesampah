import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sesampah/operator/penarikan/status/detail/detailDiproses.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PenarikanDiproses extends StatefulWidget {
  const PenarikanDiproses({Key? key}) : super(key: key);

  @override
  State<PenarikanDiproses> createState() => _PenarikanDiprosesState();
}

class _PenarikanDiprosesState extends State<PenarikanDiproses> {
  static var today = new DateTime.now();
  var formatedTanggal = new DateFormat.yMMMd().format(today);
  void initState() {
    // TODO: implement initState
    userData();
    super.initState();
  }

  userData() async {
    SharedPreferences shared = await SharedPreferences.getInstance();
    uid = shared.getString('uid');
    await FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .get()
        .then((value) {
      fullName = value.get('fullName');
      setState(() {});
    });
  }

  String? uid;
  String? fullName;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('balanceWithdraw')
            .where('status', isEqualTo: 'Diproses')
            .snapshots(),
        builder: (_, snapshot) {
          if (snapshot.hasData) {
            return Scaffold(
              body: ListView(
                children: [
                  ...snapshot.data!.docs.map(
                    (e) => Container(
                      margin: EdgeInsets.all(20),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
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
                                    e.get('status'),
                                    style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Tanggal Penarikan",
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 18,
                                ),
                              ),
                              Text(
                                formatedTanggal.toString(),
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Nama Pengguna",
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 18,
                                ),
                              ),
                              Text(
                                '$fullName',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Nominal Penarikan",
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 18,
                                ),
                              ),
                              Text(
                                e.get('nominal'),
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              TextButton(
                                onPressed: () {
                                  Navigator.push(context, MaterialPageRoute(builder: ((context) => DetailPenarikanDiproses())));
                                },
                                child: Text(
                                  "Lihat Detail",
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 18,
                                    color: Color(0xFF9E9E9E),
                                  ),
                                ),
                              )
                            ],
                          )
                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.end,
                          //   children: [
                          //     ElevatedButton(
                          //       onPressed: () {
                          //         FirebaseFirestore.instance
                          //             .collection('balanceWithdraw')
                          //             .doc(e.id)
                          //             .update({'status': "Selesai"});
                          //       },
                          //       child: Text(
                          //         "Terima",
                          //         style: TextStyle(
                          //           fontFamily: 'Poppins',
                          //           fontSize: 18,
                          //           color: Colors.white,
                          //         ),
                          //       ),
                          //       style: ElevatedButton.styleFrom(
                          //           primary: Color(0xFF6FB2D2)),
                          //     )
                          //   ],
                          // )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            );
          }
          return Text("data");
        });
  }
}
