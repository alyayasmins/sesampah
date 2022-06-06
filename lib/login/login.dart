import 'package:flutter/material.dart';
import 'package:sesampah/login/daftar.dart';
import 'package:sesampah/login/introLogin.dart';
import 'package:sesampah/login/masuk.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff6FB2D2),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 40, left: 25, right: 25),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const FirstPage()));
                      },
                      icon: const Icon(Icons.arrow_back),
                      color: Colors.white,
                    ),
                  ],
                ),
                const Padding(padding: EdgeInsets.all(20)),
                Container(
                  margin: const EdgeInsets.only(left: 40, right: 40),
                  child: Column(
                    children: const [
                      Text(
                        "Ayo Coba Sekarang",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w700,
                            fontSize: 25,
                            color: Colors.white),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Mari mulai mendapatkan untung dari sampah yang telah dipilah dan dikumpulkan",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                            fontSize: 18,
                            color: Colors.white),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Image.asset('assets/image/intro3.png'),
                const SizedBox(
                  height: 80,
                ),
                Column(
                  children: [
                    SizedBox(
                      height: 60,
                      width: 345,
                      child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Daftar()));
                          },
                          style: ElevatedButton.styleFrom(
                              primary: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10))),
                          child: const Text(
                            "Daftar",
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: Color(0xFF6FB2D2)),
                          )),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Sudah punya akun?",
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: Colors.white),
                        ),
                        TextButton(
                            onPressed: () {
                              debugPrint("test");
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const Masuk()));
                            },
                            child: const Text(
                              "Masuk",
                              style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black),
                            ))
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
