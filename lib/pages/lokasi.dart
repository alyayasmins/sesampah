import 'package:flutter/material.dart';
import 'package:sesampah/pages/home.dart';

class Location extends StatefulWidget {
  const Location({Key? key}) : super(key: key);

  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "Lokasi Bank Sampah",
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
                MaterialPageRoute(builder: (context) => const HomePage(title: '',)));
          },
          icon: const Icon(Icons.arrow_back),
          color: Colors.black,
        ),
      ),
      body: Container(
        margin: const EdgeInsets.all(20),
        height: 100,
        width: 375,
        decoration: BoxDecoration(
          border: Border.all(color: const Color.fromARGB(255, 197, 193, 193)),
        ),
        child: Row(
          children: [
            const SizedBox(
              width: 10,
            ),
            const Icon(
              Icons.location_on,
              size: 50,
              color: Color(0XFF6FB2D2),
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  "Sepat",
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "Sukajaya, Kec.Sumedang Selatan, Jawa \nBarat",
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 15,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}