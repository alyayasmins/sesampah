import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sesampah/pages/Pesanan/pesanan.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DropOff extends StatefulWidget {
  final DocumentReference<Map<String, dynamic>>? docRef2;
  const DropOff({Key? key, this.docRef2}) : super(key: key);

  @override
  State<DropOff> createState() => _DropOffState();
}

class _DropOffState extends State<DropOff> {
  void initState() {
    // TODO: implement initState
    userData();
    super.initState();
  }

  userData() async {
    SharedPreferences shared = await SharedPreferences.getInstance();
    uid = shared.getString('uid');
    await FirebaseFirestore.instance
        .collection('trashes')
        .doc(uid)
        .get()
        .then((value) {
      balance = value.get('balance').toString();

      setState(() {});
    });
  }

  String? balance;
  String? uid;
  static var today = new DateTime.now();
  var formatedTanggal = new DateFormat.yMMMd().format(today);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "Mengantarkan",
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
      body: Container(
        margin: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Lokasi Bank Sampah",
              style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 18,
                  fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Icon(
                  Icons.location_on,
                  size: 30,
                  color: Color(0xff375969),
                ),
                SizedBox(
                  width: 15,
                ),
                Text(
                  "Sepat,Sukajaya, Kec.Sumedang Selatan,\nJawa Barat",
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 16,
                  ),
                )
              ],
            ),
            Expanded(
              flex: 50,
              child: SizedBox(
                height: 20,
              ),
            ),
            Expanded(
              flex: 7,
              child: Center(
                child: Container(
                  height: 60,
                  width: 360,
                  child: ElevatedButton(
                    onPressed: () async {
                      // DocumentReference<Map<String, dynamic>> docRef =
                      //     await FirebaseFirestore.instance
                      //         .collection('swapTrashes')
                      //         .add({
                      //   'status': 'Belum Diproses',
                      //   'userId': uid,
                      //   'trash': '',
                      //   'proof': '',
                      //   'createdAt': formatedTanggal.toString(),
                      //   'updatedAt': formatedTanggal.toString(),
                      // });
                      widget.docRef2!.set({
                        'location':
                            'Sepat,Sukajaya, Kec.Sumedang Selatan,Jawa Barat',
                        'coordinat': 0
                      }, SetOptions(merge: true));
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Pesanan(
                                    address: '',
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
      ),
    );
  }
}
