import 'package:flutter/material.dart';

class Diproses extends StatefulWidget {
  const Diproses({Key? key}) : super(key: key);

  @override
  State<Diproses> createState() => _DiprosesState();
}

class _DiprosesState extends State<Diproses> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            margin: EdgeInsets.all(20),
            child: Column(
              children: [
                Container(
                  height: 20,
                  width: 75,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xFF6FB2D2),
                  ),
                  child: Text(
                    "data",
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Nama Pengguna",
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      "data",
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Nominal Penarikan",
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      "data",
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "Lihat Detail",
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 18,
                          color: Color(0xFF9E9E9E),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
