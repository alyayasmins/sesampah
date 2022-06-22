import 'package:flutter/material.dart';
import 'package:sesampah/pages/Pesanan/status/dibawa.dart';

class DetailDibawa extends StatefulWidget {
  const DetailDibawa({ Key? key }) : super(key: key);

  @override
  State<DetailDibawa> createState() => _DetailDibawaState();
}

class _DetailDibawaState extends State<DetailDibawa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "Detail Status",
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
                MaterialPageRoute(builder: (context) => const PesananDibawa()));
          },
          icon: const Icon(Icons.arrow_back),
          color: Colors.black,
        ),
      ),
    );
  }
}