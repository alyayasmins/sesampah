import 'package:flutter/material.dart';
import 'package:sesampah/pages/Pesanan/status/belumDiproses.dart';

class DetailPesananBelum extends StatefulWidget {
  const DetailPesananBelum({Key? key}) : super(key: key);

  @override
  State<DetailPesananBelum> createState() => _DetailPesananBelumState();
}

class _DetailPesananBelumState extends State<DetailPesananBelum> {
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
                MaterialPageRoute(builder: (context) => const PesananBelum()));
          },
          icon: const Icon(Icons.arrow_back),
          color: Colors.black,
        ),
      ),
    );
  }
}
