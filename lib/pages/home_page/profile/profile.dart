import 'package:flutter/material.dart';
import 'package:sesampah/pages/home_page/bottom_bar.dart';

class ProfilePerson extends StatefulWidget {
  const ProfilePerson({Key? key}) : super(key: key);

  @override
  State<ProfilePerson> createState() => _ProfilePersonState();
}

class _ProfilePersonState extends State<ProfilePerson> {
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
        leading: IconButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const BattomBar()));
          },
          icon: const Icon(Icons.arrow_back),
          color: Colors.black,
        ),
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
                    const Icon(Icons.home_rounded),
                    TextButton(
                        onPressed: () {},
                        child: const Text(
                          "Atur Alamat",
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 16,
                              color: Colors.black),
                        ))
                  ],
                ),
                Row(
                  children: [
                    const Icon(Icons.question_mark),
                    TextButton(
                        onPressed: () {},
                        child: const Text(
                          "Pertanyaan Umum",
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 16,
                              color: Colors.black),
                        ))
                  ],
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.exit_to_app,
                      color: Color(0xFF5C94AF),
                      ),
                    TextButton(
                        onPressed: () {},
                        child: const Text(
                          "Keluar",
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 16,
                              color: Color(0xFF5C94AF)),
                        ))
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
