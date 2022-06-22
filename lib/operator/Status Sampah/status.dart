import 'package:flutter/material.dart';
import 'package:sesampah/operator/Status%20Sampah/status/statusDibawa.dart';
import 'package:sesampah/operator/Status%20Sampah/status/statusDiterima.dart';
import 'package:sesampah/operator/Status%20Sampah/status/statusDitimbang.dart';
import 'package:sesampah/operator/Status%20Sampah/status/statusSelesai.dart';
import 'package:sesampah/operator/homeOperator.dart';

class StatusSampah extends StatefulWidget {
  const StatusSampah({Key? key}) : super(key: key);

  @override
  State<StatusSampah> createState() => _StatusSampahState();
}

class _StatusSampahState extends State<StatusSampah> {
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
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
          color: Colors.black,
        ),
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
                    "Diterima",
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
            const Expanded(
              child: TabBarView(children: [
                StatusDiterima(),
                StatusDibawa(),
                StatusDitimbang(),
                StatusSelesai(),
              ]),
            )
          ],
        ),
      ),
    );
  }
}
