import 'package:flutter/material.dart';
import 'package:sesampah/pages/tarik_sampah/tarik.dart';

class RiwayatPenarikan extends StatefulWidget {
  const RiwayatPenarikan({Key? key}) : super(key: key);

  @override
  State<RiwayatPenarikan> createState() => _RiwayatPenarikanState();
}

class _RiwayatPenarikanState extends State<RiwayatPenarikan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "Riwayat Penarikan",
          style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Colors.black),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const TarikSampah()));
          },
          icon: const Icon(Icons.arrow_back),
          color: Colors.black,
        ),
      ),
      body: DefaultTabController(
        length: 3,
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
                    "Diproses",
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
            const Expanded(
              child: TabBarView(children: [
                Text(""),
                Text(""),
                Text(""),
              ]),
            )
          ],
        ),
      ),
    );
  }
}
