import 'package:flutter/material.dart';

class LihatSemua extends StatefulWidget {
  const LihatSemua({Key? key}) : super(key: key);

  @override
  State<LihatSemua> createState() => _LihatSemuaState();
}

class _LihatSemuaState extends State<LihatSemua> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "Lihat Semua",
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
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Row(
          
        ),
      ),
    );
  }
}
