import 'package:flutter/material.dart';
import 'package:sesampah/pages/Pesanan/status/selesai.dart';

class DetailSelesai extends StatefulWidget {
  const DetailSelesai({ Key? key }) : super(key: key);

  @override
  State<DetailSelesai> createState() => _DetailSelesaiState();
}

class _DetailSelesaiState extends State<DetailSelesai> {
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
                MaterialPageRoute(builder: (context) => const PesananSelesai()));
          },
          icon: const Icon(Icons.arrow_back),
          color: Colors.black,
        ),
      ),
    );
  }
}