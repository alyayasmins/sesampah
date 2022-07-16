import 'package:flutter/material.dart';
import 'package:sesampah/pages/tarik_sampah/status/belum.dart';
import 'package:sesampah/pages/tarik_sampah/status/diproses.dart';
import 'package:sesampah/pages/tarik_sampah/status/selesai.dart';
import 'package:sesampah/pages/tarik_sampah/tarik.dart';

class RiwayatPenarikan extends StatefulWidget {
  final String Nominal;
  const RiwayatPenarikan({Key? key, required this.Nominal}) : super(key: key);

  @override
  State<RiwayatPenarikan> createState() => _RiwayatPenarikanState();
}

class _RiwayatPenarikanState extends State<RiwayatPenarikan> {
  int? balance;
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
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => TarikSampah(balance: 0)));
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
              child: const TabBar(
                tabs: [
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
                ],
                isScrollable: true,
                unselectedLabelColor: Colors.white30,
                labelPadding: EdgeInsets.symmetric(horizontal: 46),
                indicator: UnderlineTabIndicator(
                  borderSide: BorderSide(color: Color(0xFF5C94AF), width: 3),
                  insets: EdgeInsets.symmetric(horizontal: 35),
                ),
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  BelumDiproses(
                    nominal: widget.Nominal,
                  ),
                  Diproses(
                    nominal: widget.Nominal,
                  ),
                  Selesai(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
