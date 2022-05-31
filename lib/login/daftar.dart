import 'package:flutter/material.dart';
import 'package:sesampah/pages/home.dart';
import 'package:sesampah/login/login.dart';
import 'package:sesampah/pages/home.dart';

class Daftar extends StatefulWidget {
  const Daftar({
    Key? key,
  }) : super(key: key);

  @override
  State<Daftar> createState() => _DaftarState();
}

class _DaftarState extends State<Daftar> {
  bool _isHidePassword = true;

  void _togglePasswordVisibility() {
    setState(() {
      _isHidePassword = !_isHidePassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "Daftar",
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
                MaterialPageRoute(builder: (context) => const Login()));
          },
          icon: const Icon(Icons.arrow_back),
          color: Colors.black,
        ),
      ),
      body: ListView(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 10),
            child: Column(
              children: [
                const Text(
                  "Ayo daftar sekarang !",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 40,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 20),
                      child: const Text(
                        "Nama Lengkap",
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 16,
                            color: Colors.black),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: Form(
                        child: Column(
                          children: <Widget>[
                            Padding(
                                padding: const EdgeInsets.all(8),
                                child: TextFormField(
                                  decoration: InputDecoration(
                                      hintText: "Masukkan Nama Lengkap",
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10))),
                                ))
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 20),
                      child: const Text(
                        "Email",
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 16,
                            color: Colors.black),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: Form(
                        child: Column(
                          children: <Widget>[
                            Padding(
                                padding: const EdgeInsets.all(8),
                                child: TextFormField(
                                  keyboardType: TextInputType.emailAddress,
                                  decoration: InputDecoration(
                                      hintText: "Masukkan Email",
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10))),
                                ))
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 20),
                      child: const Text(
                        "Kata Sandi",
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 16,
                            color: Colors.black),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: Form(
                        child: Column(
                          children: <Widget>[
                            Padding(
                                padding: const EdgeInsets.all(8),
                                child: TextFormField(
                                  obscureText: _isHidePassword,
                                  autofocus: false,
                                  initialValue: '',
                                  keyboardType: TextInputType.text,
                                  decoration: InputDecoration(
                                      hintText: "Masukkan Kata Sandi",
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      suffixIcon: GestureDetector(
                                        onTap: () {
                                          _togglePasswordVisibility();
                                        },
                                        child: Icon(
                                          _isHidePassword
                                              ? Icons.visibility_off
                                              : Icons.visibility,
                                          color: _isHidePassword
                                              ? Colors.grey
                                              : Colors.blue,
                                        ),
                                      )),
                                ))
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 20),
                      child: const Text(
                        "Alamat Rumah",
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 16,
                            color: Colors.black),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: Form(
                        child: Column(
                          children: <Widget>[
                            Padding(
                                padding: const EdgeInsets.all(8),
                                child: TextFormField(
                                  decoration: InputDecoration(
                                      hintText: "Masukkan Alamat Rumah",
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10))),
                                ))
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 80,
          ),
          Column(
            children: [
              SizedBox(
                height: 60,
                width: 388,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomePage(title: '',)));
                  },
                  style: ElevatedButton.styleFrom(
                    primary: const Color(0xFF375969),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  child: const Text(
                    "Daftar",
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 16,
                        fontWeight: FontWeight.w700),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
