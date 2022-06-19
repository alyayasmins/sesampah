import 'package:flutter/material.dart';
import 'package:sesampah/login/authentication.dart';
import 'package:sesampah/login/introLogin.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:sesampah/operator/homeOperator.dart';
import 'package:sesampah/pages/home_page/bottom_bar.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: //HomeOperator()
          //FirstPage()
          StreamBuilder(
        stream: AuthService().firebaseAuth.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return const BattomBar();
          } else {
            return const FirstPage();
          }
        },
      ),
    );
  }
}
