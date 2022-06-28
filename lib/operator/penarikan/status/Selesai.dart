import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sesampah/operator/penarikan/status/detail/detailSelesai.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PenarikanSelesai extends StatefulWidget {
  const PenarikanSelesai({Key? key}) : super(key: key);

  @override
  State<PenarikanSelesai> createState() => _PenarikanSelesaiState();
}

class _PenarikanSelesaiState extends State<PenarikanSelesai> {
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

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection('balanceWithdraw')
          .where('status', isEqualTo: 'Selesai')
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
                              fullName.toString(),
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        DetailPenarikanSelesai(
                                      nominal: e.get('nominal'),
                                      status: e.get('status'),
                                      id: e.id,
                                      doc: e,
                                    ),
                                  ),
                                );
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
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        }
        return Text("data");
      },
    );
  }
}
