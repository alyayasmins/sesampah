import 'package:flutter/material.dart';
import 'package:sesampah/pages/Pesanan/pesanan.dart';

class DropOff extends StatefulWidget {
  const DropOff({Key? key}) : super(key: key);

  @override
  State<DropOff> createState() => _DropOffState();
}

class _DropOffState extends State<DropOff> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "Mengantarkan",
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
      body: Container(
        margin: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Lokasi Bank Sampah",
              style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 18,
                  fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Icon(
                  Icons.location_on,
                  size: 30,
                  color: Color(0xff375969),
                ),
                SizedBox(
                  width: 15,
                ),
                Text(
                  "Sepat,Sukajaya, Kec.Sumedang Selatan,\nJawa Barat",
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 16,
                  ),
                )
              ],
            ),
            Expanded(
              flex: 50,
              child: SizedBox(
                height: 20,
              ),
            ),
            Expanded(
              flex: 7,
              child: Center(
                child: Container(
                  height: 60,
                  width: 360,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Pesanan()));
                    },
                    style: ElevatedButton.styleFrom(
                      primary: const Color(0xFF375969),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                    child: const Text(
                      "Lanjut",
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 16,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
