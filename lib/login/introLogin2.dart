import 'package:flutter/material.dart';
import 'package:sesampah/login/introLogin.dart';
import 'package:sesampah/login/login.dart';

class LoginIntro extends StatelessWidget {
  const LoginIntro({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff6FB2D2),
      body: Container(
        width: MediaQuery.of(context).size.width / 0.5,
        height: MediaQuery.of(context).size.height / 1,
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
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
                    Image.asset('assets/image/intro2.png'),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 40, right: 40),
                      child: Column(
                        children: const [
                          Text(
                            "Mari Menjaga Bumi",
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
                            "Mengumpulkan sampah dan memilahnya untuk didaur ulang ",
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
                      height: 160,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomSheet: Container(
        color: const Color(0xff6FB2D2),
        padding: const EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SizedBox(
              height: 50,
              width: 120,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Login()));
                },
                child: Row(mainAxisSize: MainAxisSize.min, children: const [
                  Text(
                    "Lanjut",
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  SizedBox(
                    width: 3,
                  ),
                  Icon(Icons.keyboard_arrow_right),
                ]),
                style: ElevatedButton.styleFrom(
                    primary: const Color(0xFF375969),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
