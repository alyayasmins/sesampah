import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sesampah/login/introLogin.dart';
import 'package:sesampah/operator/homeOperator.dart';
import 'package:sesampah/pages/home_page/bottom_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class authCheck extends StatefulWidget {
  const authCheck({Key? key}) : super(key: key);

  @override
  State<authCheck> createState() => _authCheckState();
}

class _authCheckState extends State<authCheck> {
  void initState() {
    super.initState();
    userData();
  }

  userData() async {
    SharedPreferences shared = await SharedPreferences.getInstance();
    uid = await shared.getString('uid');
    print(uid);
    await FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .get()
        .then((value) {
      if (value.exists) {
        if (value.get('role') == 'operator') {
          print('role');
          Future.delayed(Duration.zero, () {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: ((context) => HomeOperator())));
          });
        } else {
          if (value.get('role') == 'user') {
            Future.delayed(Duration.zero, () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: ((context) => BattomBar())));
            });
          }
        }
      } else {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: ((context) => FirstPage())));
      }
    });
  }

  String? balance;
  String? uid;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }
}
