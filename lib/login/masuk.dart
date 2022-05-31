import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sesampah/pages/home.dart';
import 'package:sesampah/login/login.dart';

class Masuk extends StatefulWidget {
  const Masuk({
    Key? key,
  }) : super(key: key);

  @override
  State<Masuk> createState() => _MasukState();
}

class _MasukState extends State<Masuk> {
  bool _isHidePassword = true;
//   final _emailController = TextEditingController();
//   final _passwordController = TextEditingController();

//   var fSnackBar = const SnackBar(
//     content: Text("Kolom Email & Password Harus Diisi!"),
//   );

//   var sSnackBar = const SnackBar(
//     content: Text("Kolom Password Harus Diisi!"),
//   );

//   var tSnackBar = const SnackBar(
//     content: Text("Kolom Email Harus Diisi!"),
//   );

//   Future signIn() async {
//     try {
//       if (_emailController.text.isNotEmpty &
//           _passwordController.text.isNotEmpty) {
//         await FirebaseAuth.instance.signInWithEmailAndPassword(
//           email: _emailController.text.trim(),
//           password: _passwordController.text.trim(),
//         );
//       } else if (_emailController.text.isNotEmpty &
//           _passwordController.text.isNotEmpty) {
//         ScaffoldMessenger.of(context).showSnackBar(sSnackBar);
//       } else if (_emailController.text.isNotEmpty &
//           _passwordController.text.isNotEmpty) {
//         ScaffoldMessenger.of(context).showSnackBar(tSnackBar);
//       } else if (_emailController.text.isNotEmpty &
//           _passwordController.text.isNotEmpty) {
//         ScaffoldMessenger.of(context).showSnackBar(fSnackBar);
//       }
//     } catch (e) {
//       showDialog<void>(
//         context: context,
//         barrierDismissible: false,
//         builder: (BuildContext context){
//         return AlertDialog(
//           title: const Text("Teradi Error"),
//           content: const SingleChildScrollView(
//             child: Text("Email dan Kata Sandi yang Anda Masukkan Tidak valid, Coba Masukkan Email dan Kata Sandi yang valid."),
//           ),
//           actions: <Widget>[
//               TextButton(
//                 child: const Text('Got it'),
//                 onPressed: () {
//                   Navigator.of(context).pop();
//                   _emailController.clear();
//                   _passwordController.clear();
//                 },
//               ),
//             ],
//       );});
//       };
//     }
//   }

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
      body: ListView(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 40),
            child: Column(
              children: [
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
                    "Masuk",
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
