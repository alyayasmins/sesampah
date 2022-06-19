import 'package:flutter/material.dart';
import 'package:sesampah/operator/homeOperator.dart';

class LihatSaldo extends StatefulWidget {
  const LihatSaldo({Key? key}) : super(key: key);

  @override
  State<LihatSaldo> createState() => _LihatSaldoState();
}

class _LihatSaldoState extends State<LihatSaldo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "Saldo Pengguna",
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
    );
  }
}
