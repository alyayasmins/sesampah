import 'package:flutter/material.dart';

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
          onPressed: () {},
          icon: const Icon(Icons.arrow_back),
          color: Colors.black,
        ),
      ),
      body: Column(
        children: [
          Container(
            height: 100,
            width: 300,
            color: const Color(0xFFE2F0F6),
            child:Column(
              children: [
                Row(
                  children:  [
                    const Text("data"),
                    IconButton(
                      onPressed: () {}, 
                      icon: const Icon(Icons.edit))
                  ],
                ),
                const Text("data")
              ],
            ),
          )
        ],
      ),
    );
  }
}
