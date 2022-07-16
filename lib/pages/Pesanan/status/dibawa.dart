import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sesampah/pages/Pesanan/status/Detail/detailDibawa.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SampahDibawa extends StatefulWidget {
  const SampahDibawa({Key? key}) : super(key: key);

  @override
  State<SampahDibawa> createState() => _SampahDibawaState();
}

class _SampahDibawaState extends State<SampahDibawa> {
  void initState() {
    // TODO: implement initState
    userData();
    super.initState();
  }

  userData() async {
    SharedPreferences shared = await SharedPreferences.getInstance();
    uid = await shared.getString('uid');
    await FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .get()
        .then((value) {
      setState(() {});
    });
  }

  String? uid;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('swapTrashes')
            .where('status', isEqualTo: 'Dibawa')
            .where('userId', isEqualTo: uid)
            .snapshots(),
        builder: (_, snapshots) {
          if (snapshots.hasData) {
            print(snapshots.data!.size);
            return ListView(
              children: [
                ...snapshots.data!.docs.map(
                  (e) => Container(
                    margin: EdgeInsets.all(20),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              height: 30,
                              width: 100,
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
                              "Pengantaran",
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 18,
                              ),
                            ),
                            Text(
                              e.get('delivery'),
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children:
                              List.generate(e.get('trash').length, (index) {
                            print(e.get('trash').length);
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  e.get('trash')[index]['subCategory'],
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 18,
                                  ),
                                ),
                                Text(
                                  e.get('trash')[index]['price'].toString() +
                                      '/kg',
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 18,
                                  ),
                                ),
                              ],
                            );
                          }),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => DetailDibawa(
                                      trash: e.get('trash'),
                                      location: e.get('location'),
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
            );
          } else {
            return Text('Loading');
          }
        },
      ),
    );
  }
}
