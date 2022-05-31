import 'package:flutter/material.dart';

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
        centerTitle: true,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.arrow_back),
          color: Colors.black,
        ),
      ),
    );
  }
}
