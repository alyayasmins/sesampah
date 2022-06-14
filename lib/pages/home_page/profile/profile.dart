import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sesampah/login/authentication.dart';
import 'package:sesampah/login/login.dart';

class ProfilePerson extends StatefulWidget {
  const ProfilePerson({Key? key}) : super(key: key);

  @override
  State<ProfilePerson> createState() => _ProfilePersonState();
}

class _ProfilePersonState extends State<ProfilePerson> {
  FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "Akun",
          style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Center(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color(0xFFE2F0F6),
              ),
              margin: const EdgeInsets.all(20),
              height: 120,
              width: 375,
              child: Container(
                margin: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Alya",
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF6FB2D2),
                          ),
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.edit,
                              color: Color(0XFF6FB2D2),
                            ))
                      ],
                    ),
                    const Text(
                      "alyayasmin@gmail.com",
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 18,
                          color: Color(0xFF6FB2D2)),
                    )
                  ],
                ),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(20),
            child: Column(
              children: [
                Row(
                  children: [
                    InkWell(
                      onTap: () {},
                      child: Row(
                        children: const [
                          Icon(Icons.home_rounded),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Atur Alamat",
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 16,
                              color: Colors.black,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    InkWell(
                      onTap: () {
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
                                fontFamily: 'Poppins',
                                color: Color(0xff757575)),
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
                      child: Row(
                        children: const [
                          Icon(Icons.question_mark),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Pertanyaan Umum",
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 16,
                              color: Colors.black,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        AlertDialog alert = AlertDialog(
                          title: const Text(
                            "Konfirmasi",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              color: Colors.black,
                            ),
                          ),
                          content: const Text(
                            "Apakah anda yakin ingin keluar dari akun ini",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                color: Color(0xff757575)),
                          ),
                          actions: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                OutlinedButton(
                                  child: const Text(
                                    "Tidak",
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
                                const SizedBox(
                                  width: 15,
                                ),
                                OutlinedButton(
                                  child: const Text(
                                    "Iya",
                                    style: TextStyle(
                                        fontFamily: 'Poppins',
                                        color: Color(0xff6FB2D2)),
                                  ),
                                  onPressed: () async {
                                    await AuthService().signOut();
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const Login()));
                                  },
                                  style: OutlinedButton.styleFrom(
                                    side: const BorderSide(
                                      width: 2.0,
                                      color: Color(0xff6FB2D2),
                                    ),
                                    shape: const StadiumBorder(),
                                  ),
                                ),
                              ],
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
                      child: Row(
                        children: const [
                          Icon(
                            Icons.exit_to_app,
                            color: Color(0xff5C94AF),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Keluar",
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 16,
                              color: Color(0xff5C94AF),
                            ),
                          )
                        ],
                      ),
                    ),
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
