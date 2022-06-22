import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sesampah/pages/home_page/bottom_bar.dart';
import 'package:sesampah/pages/tarik_sampah/konfirmasi.dart';
import 'package:sesampah/pages/tarik_sampah/riwayat.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TarikSampah extends StatefulWidget {
  final int balance;
  const TarikSampah({Key? key, required this.balance}) : super(key: key);

  @override
  State<TarikSampah> createState() => _TarikSampahState();
}

class _TarikSampahState extends State<TarikSampah> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  TextEditingController numberController = TextEditingController();

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
      balance = value.get('balance').toString();

      setState(() {});
    });
  }

  String? balance;
  String? uid;
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "Tarik Saldo",
          style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Colors.black),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>  RiwayatPenarikan(Nominal: '',)));
              },
              icon: const Icon(
                Icons.history,
                color: Colors.black,
                size: 30,
              ))
        ],
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const BattomBar()));
          },
          icon: const Icon(Icons.arrow_back),
          color: Colors.black,
        ),
      ),
      body: Column(
        children: [
          const Expanded(
            flex: 1,
            child: Center(
                child: Text(
              "Saldo Anda",
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 18,
              ),
            )),
          ),
          Expanded(
            flex: 15,
            child: Column(
              children: [
                Expanded(
                    flex: 5,
                    child: Text(
                      'Rp.' + '$balance',
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 24,
                          fontWeight: FontWeight.bold),
                    )),
                Expanded(
                  flex: 80,
                  child: Column(
                    children: [
                      Container(
                        width: 388,
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          validator: (value) =>
                              value!.isEmpty ? 'data masih kosong' : null,
                          controller: numberController,
                          decoration: InputDecoration(
                            hintText: "Masukkan jumlah uang",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                        ),
                      ),
                      const Expanded(
                        flex: 40,
                        child: SizedBox(
                          height: 40,
                        ),
                      ),
                      Expanded(
                        flex: 4,
                        child: SizedBox(
                          height: 60,
                          width: 388,
                          child: ElevatedButton(
                            onPressed: () async {
                              setState(() {
                                loading = true;
                              });
                              if (numberController.text == "") {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text("Semua kolom wajib di isi!"),
                                    backgroundColor: Colors.grey,
                                  ),
                                );
                              } else if (int.parse(balance!) <
                                  int.parse(numberController.text)) {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(const SnackBar(
                                  content: Text("Saldo tidak cukup"),
                                ));
                              } else {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Konfirmasi(
                                            nominal: numberController.text)));
                              }
                              setState(() {
                                loading = false;
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              primary: const Color(0xFF375969),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                            child: const Text(
                              "Tarik",
                              style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
