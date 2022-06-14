import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sesampah/login/login.dart';
import 'package:sesampah/login/masuk.dart';
import 'package:sesampah/pages/home_page/bottom_bar.dart';
import 'authentication.dart';

class Daftar extends StatefulWidget {
  const Daftar({
    Key? key,
  }) : super(key: key);

  @override
  State<Daftar> createState() => _DaftarState();
}

class _DaftarState extends State<Daftar> {
  bool _isHidePassword = true;

  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  bool loading = false;

  // String? fullName;
  // String? email;
  // String? password;
  // String? address;

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
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: ListView(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 10),
              child: Form(
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
                                      controller: fullNameController,
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
                                      controller: emailController,
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
                                      keyboardType: TextInputType.text,
                                      controller: passwordController,
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
                                      controller: addressController,
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
            ),
            const SizedBox(
              height: 80,
            ),
            loading
                ? const CircularProgressIndicator()
                : Container(
                    height: 60,
                    width: MediaQuery.of(context).size.width,
                    child: ElevatedButton(
                      onPressed: () async {
                        setState(() {
                          loading = true;
                        });
                        if (emailController.text == "" ||
                            passwordController == "") {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("Semua kolom wajib di isi!"),
                              backgroundColor: Colors.red,
                            ),
                          );
                        } else {
                          User? result = await AuthService().signUp(
                              emailController.text, passwordController.text, context);
                          if (result != null) {
                            print("Berhasil");
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const BattomBar()),
                                (route) => false);
                          }
                        }
                        setState(() {
                          loading = false;
                        });
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
                  ),
          ],
        ),
      ),
    );
  }
}
