import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sesampah/login/authentication.dart';
import 'package:sesampah/pages/home_page/bottom_bar.dart';
import 'package:sesampah/login/login.dart';

class Masuk extends StatefulWidget {
  const Masuk({
    Key? key,
  }) : super(key: key);

  @override
  State<Masuk> createState() => _MasukState();
}

class _MasukState extends State<Masuk> {
  final GlobalKey<FormState> globalFormKey = GlobalKey();

  bool _obscureText = true;
  bool _isHidePassword = true;

  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  bool loading = false;

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
          "Masuk",
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
              margin: const EdgeInsets.only(top: 40),
              child: Column(
                children: [
                  Form(
                    child: Column(
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
                                              BorderRadius.circular(10),
                                        ),
                                      ),
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'Email tidak boleh kosong!';
                                        } else if (!value.contains('@')) {
                                          return 'Format email salah';
                                        }
                                        return null;
                                      },
                                    ))
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
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
                                      controller: passController,
                                      decoration: InputDecoration(
                                          hintText: "Masukkan Kata Sandi",
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          suffixIcon: GestureDetector(
                                            onTap: () {
                                              _togglePasswordVisibility();
                                              _obscureText = !_obscureText;
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
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'Password tidak boleh kosong';
                                        } else if (value.length < 6) {
                                          return 'Password kurang dari 6!';
                                        }
                                        return null;
                                      }))
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
            loading
                ? CircularProgressIndicator()
                : Container(
                    height: 60,
                    width: MediaQuery.of(context).size.width,
                    child: ElevatedButton(
                      onPressed: () async {
                        setState(() {
                          loading = true;
                        });
                        if (emailController.text == "" ||
                            passController == "") {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("Semua kolom wajib di isi!"),
                              backgroundColor: Colors.red,
                            ),
                          );
                        } else {
                          User? result = await AuthService().Login(
                              emailController.text,
                              passController.text,
                              context);
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
