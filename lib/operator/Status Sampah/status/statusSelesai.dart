import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sesampah/operator/Status%20Sampah/status/detail/dSSelesai.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StatusSelesai extends StatefulWidget {
  const StatusSelesai({Key? key}) : super(key: key);

  @override
  State<StatusSelesai> createState() => _StatusSelesaiState();
}

class _StatusSelesaiState extends State<StatusSelesai> {
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
      setState(() {});
    });
  }

  String? uid;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection('swapTrashes')
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
                              // width: 90,
                              padding: EdgeInsets.symmetric(horizontal: 10),
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
                              "data",
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
                              "data",
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
                              "data",
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 18,
                              ),
                            ),
                            Text(
                              "data",
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: ((context) => dsSelesai())));
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
