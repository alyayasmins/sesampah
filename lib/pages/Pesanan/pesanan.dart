import 'package:flutter/material.dart';
import 'package:sesampah/pages/Pesanan/status/belumDiproses.dart';
import 'package:sesampah/pages/Pesanan/status/dibawa.dart';
import 'package:sesampah/pages/Pesanan/status/ditimbang.dart';
import 'package:sesampah/pages/Pesanan/status/selesai.dart';

class Pesanan extends StatefulWidget {
  final String address;
  const Pesanan({Key? key, required this.address}) : super(key: key);

  @override
  State<Pesanan> createState() => _PesananState();
}

class _PesananState extends State<Pesanan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "Status Sampah",
          style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: DefaultTabController(
        length: 4,
        child: Column(
          children: <Widget>[
            Container(
              constraints: const BoxConstraints.expand(height: 50),
              child: const TabBar(tabs: [
                Tab(
                  child: Text(
                    "Belum\nDiproses",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Poppins',
                      fontSize: 14,
                    ),
                  ),
                ),
                Tab(
                  child: Text(
                    "Dibawa",
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Poppins',
                      fontSize: 14,
                    ),
                  ),
                ),
                Tab(
                  child: Text(
                    "Ditimbang",
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Poppins',
                      fontSize: 14,
                    ),
                  ),
                ),
                Tab(
                  child: Text(
                    "Selesai",
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Poppins',
                      fontSize: 14,
                    ),
                  ),
                ),
              ]),
            ),
            Expanded(
              child: TabBarView(children: [
                SampahBelum(),
                SampahDibawa(),
                SampahDitimbang(),
                SampahSelesai(),
              ]),
            )
          ],
        ),
      ),
    );
  }
}
