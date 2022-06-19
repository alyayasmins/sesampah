import 'package:flutter/material.dart';
import 'package:sesampah/operator/homeOperator.dart';

class Penarikan extends StatefulWidget {
  const Penarikan({Key? key}) : super(key: key);

  @override
  State<Penarikan> createState() => _PenarikanState();
}

class _PenarikanState extends State<Penarikan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "Penarikan",
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
                MaterialPageRoute(builder: (context) => const HomeOperator()));
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
