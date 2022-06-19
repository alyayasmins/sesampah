import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sesampah/pages/tarik_sampah/riwayat.dart';
import 'package:sesampah/pages/tarik_sampah/tarik.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';

class Konfirmasi extends StatefulWidget {
  final String nominal;
  const Konfirmasi({Key? key, required this.nominal}) : super(key: key);

  @override
  State<Konfirmasi> createState() => _KonfirmasiState();
}

class _KonfirmasiState extends State<Konfirmasi> {
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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "Konfirmasi",
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Tarik Tunai",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
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
                      "$fullName",
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
                      widget.nominal,
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
                Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Total",
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      widget.nominal,
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 60,
            width: 388,
            child: ElevatedButton(
              onPressed: () {
                AlertDialog alert = AlertDialog(
                  title: const Text(
                    "Konfirmasi",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      color: Colors.black,
                    ),
                  ),
                  content: const Text(
                    "Apakah Anda yakin untuk menarik uang ini?",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: 'Poppins', color: Color(0xff757575)),
                  ),
                  actions: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        OutlinedButton(
                          child: const Text(
                            "Tidak",
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                color: Color(0xff6FB2D2)),
                          ),
                          onPressed: () => Navigator.of(context).pop(),
                          style: OutlinedButton.styleFrom(
                            side: const BorderSide(
                              width: 2.0,
                              color: Color(0xff6FB2D2),
                            ),
                            shape: const StadiumBorder(),
                          ),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        OutlinedButton(
                          child: const Text(
                            "Iya",
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                color: Color(0xff6FB2D2)),
                          ),
                          onPressed: () async {
                            await FirebaseFirestore.instance
                                .collection('balanceWithdraw')
                                .add({
                              'status': 'Menunggu',
                              'userId': uid,
                              'nominal': widget.nominal,
                              'proof': '',
                              'createdAt': formatedTanggal.toString(),
                              'updatedAt': formatedTanggal.toString(),
                            });

                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const RiwayatPenarikan()));
                          },
                          style: OutlinedButton.styleFrom(
                            side: const BorderSide(
                              width: 2.0,
                              color: Color(0xff6FB2D2),
                            ),
                            shape: const StadiumBorder(),
                          ),
                        ),
                      ],
                    ),
                  ],
                );
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return alert;
                  },
                );
              },
              style: ElevatedButton.styleFrom(
                primary: const Color(0xFF375969),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
              ),
              child: const Text(
                "Konfirmasi",
                style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 16,
                    fontWeight: FontWeight.w700),
              ),
            ),
          )
        ],
      ),
    );
  }
}
// 
