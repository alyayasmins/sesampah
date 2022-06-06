import 'package:flutter/material.dart';
import 'package:sesampah/pages/home_page/bottom_bar.dart';
import 'package:sesampah/pages/tarik_sampah/konfirmasi.dart';

class TarikSampah extends StatefulWidget {
  const TarikSampah({Key? key}) : super(key: key);

  @override
  State<TarikSampah> createState() => _TarikSampahState();
}

class _TarikSampahState extends State<TarikSampah> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "Tukar Sampah",
          style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Colors.black),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.history,
                color: Colors.black,
                size: 30,
              ))
        ],
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const BattomBar()));
          },
          icon: const Icon(Icons.arrow_back),
          color: Colors.black,
        ),
      ),
      body: ListView(
        children: [
          Container(
            margin: const EdgeInsets.all(30),
            child: Column(
              children: [
                const Align(
                  alignment: Alignment.center,
                ),
                const Text(
                  "Saldo Anda",
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 16,
                      color: Color(0xFF8F8F8F)),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Rp.100.000",
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      hintText: "Masukkan jumlah uang",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5))),
                ),
                const SizedBox(
                  height: 480,
                ),
                SizedBox(
                  height: 60,
                  width: 388,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Konfirmasi()));
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
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
