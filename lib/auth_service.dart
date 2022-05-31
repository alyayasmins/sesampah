// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:sesampah/login/daftar.dart';
// import 'package:sesampah/login/login.dart';
// import 'package:sesampah/login/masuk.dart';

// class AuthScreen extends StatefulWidget {
//   const AuthScreen({Key? key}) : super(key: key);

//   @override
//   State<AuthScreen> createState() => _AuthScreenState();
// }

// class _AuthScreenState extends State<AuthScreen> {
//   bool showMasuk = true;
//   void toggleScreen() {
//     setState(() {
//       showMasuk = !showMasuk;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     if (showMasuk) {
//       return Masuk(showDaftar: toggleScreen);
//     } else {
//       return Daftar(showMasuk: toggleScreen);
//     }
//   }
// }
