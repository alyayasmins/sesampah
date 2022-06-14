import 'package:flutter/material.dart';
import 'package:sesampah/pages/location/lokasi.dart';
import 'package:sesampah/pages/tarik_sampah/tarik.dart';
import 'package:sesampah/pages/tukar_sampah/tukar.dart';

class PageHome extends StatefulWidget {
  const PageHome({Key? key, required this.title}) : super(key: key);
  final String? title;

  @override
  State<PageHome> createState() => _PageHomeState();
}

class _PageHomeState extends State<PageHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 60, left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "Hai, Alya",
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Selamat datang di Sesampah",
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  IconButton(
                    onPressed: () {
                      AlertDialog alert = AlertDialog(
                        title: const Text(
                          "Segera Hadir",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            color: Colors.black,
                          ),
                        ),
                        content: const Text(
                          "Fitur ini masih dalam tahap perencanaan",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontFamily: 'Poppins', color: Color(0xff757575)),
                        ),
                        actions: [
                          Center(
                            child: OutlinedButton(
                              child: const Text(
                                "OK",
                                style: TextStyle(
                                    fontFamily: 'Poppins',
                                    color: Color(0xff6FB2D2)),
                              ),
                              onPressed: () => Navigator.of(context).pop(),
                              style: OutlinedButton.styleFrom(
                                side: const BorderSide(
                                  width: 2.0,
                                  color: Color(0xff6FB2D2),
                                ),
                                shape: const StadiumBorder(),
                              ),
                            ),
                          ),
                        ],
                      );
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return alert;
                        },
                      );
                    },
                    icon: const Icon(
                      Icons.notifications,
                      color: Color(0xff6FB2D2),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              height: 150,
              width: 375,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color(0xFF6FB2D2),
              ),
              child: Column(
                children: const [
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Saldo anda",
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Rp.100.000",
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Container(
              margin: const EdgeInsets.only(top: 10, left: 28, right: 23),
              child: Row(
                children: [
                  Column(
                    children: [
                      SizedBox(
                        height: 130,
                        width: 110,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              shadowColor: Colors.grey,
                              elevation: 5,
                              primary: Colors.white),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const TukarSampah()));
                          },
                          child: Container(
                            height: 90,
                            width: 90,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image:
                                      AssetImage('assets/image/trash-can.png')),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const Text(
                        "Tukar Sampah",
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 14,
                            fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Column(
                    children: [
                      SizedBox(
                        height: 130,
                        width: 110,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              shadowColor: Colors.grey,
                              elevation: 5,
                              primary: Colors.white),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const TarikSampah()));
                          },
                          child: Container(
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('assets/image/coin.png')),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const Text(
                        "Tarik Saldo",
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 14,
                            fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Column(
                    children: [
                      SizedBox(
                        height: 130,
                        width: 110,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              shadowColor: Colors.grey,
                              elevation: 5,
                              primary: Colors.white),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Location()));
                          },
                          child: Container(
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('assets/image/location.png')),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const Text(
                        "Lokasi Sampah",
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 14,
                            fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
                margin: const EdgeInsets.only(right: 30, left: 30),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        "Tukaran Terakhir",
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      // TextButton(
                      //   onPressed: () {},
                      //   child: const Text(
                      //     "Lihat Semua",
                      //     style: TextStyle(
                      //       fontFamily: 'Poppins',
                      //       fontSize: 16,
                      //       fontWeight: FontWeight.w400,
                      //       color: Color(0XFF8F8F8F)
                      //     ),
                      //   )
                      // )
                    ])),
          ],
        ),
      ),
    );
  }
}
