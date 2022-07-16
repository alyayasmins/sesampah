import 'package:flutter/material.dart';

class DetailDitimbang extends StatefulWidget {
  const DetailDitimbang({Key? key}) : super(key: key);

  @override
  State<DetailDitimbang> createState() => _DetailDitimbangState();
}

class _DetailDitimbangState extends State<DetailDitimbang> {
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
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
          color: Colors.black,
        ),
      ),
    );
  }
}
