import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class BelumDiproses extends StatefulWidget {
  const BelumDiproses({Key? key}) : super(key: key);

  @override
  State<BelumDiproses> createState() => _BelumDiprosesState();
}

class _BelumDiprosesState extends State<BelumDiproses> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
String? fullName;

@override
Widget build(BuildContext context) {
  return Scaffold(
    body: StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection('balanceWithdraw')
          .where('status', isEqualTo: 'Menunggu').where('userId', isEqualTo: '$fullName').snapshots(),
      builder: (_, snapshots) {
        return ListView(
          children: [
            Container(
              margin: EdgeInsets.all(20),
              child: Column(
                children: [
                  Container(
                    height: 20,
                    width: 75,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0xFF6FB2D2),
                    ),
                    child: Text(
                      "data",
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
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
                        '',
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
                        "data",
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      TextButton(
                        onPressed: () {},
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
            )
          ],
        );
      },
    ),
  );
}
