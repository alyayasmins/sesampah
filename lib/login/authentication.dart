import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  // static Future<FirebaseUser> signInAnonymous() async {
  //   try {
  //     AuthResult result = await firebaseAuth.signInAnonymously();
  //     FirebaseUser firebaseUser = result.user;

  //     return firebaseUser;
  //   } catch (e) {
  //     print(e.toString());

  //     return null;
  //   }
  // }

  Future<User?> signUp(
      String email, String password, BuildContext context) async {
    try {
      UserCredential userCredential = await firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(e.message.toString()),
        backgroundColor: Colors.red,
      ));
    } catch (e) {
      print(e);
    }
  }

  Future<User?> Login(
      String email, String password, BuildContext context) async {
    try {
      UserCredential userCredential = await firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(e.message.toString()),
        backgroundColor: Colors.red,
      ));
    } catch (e) {
      print(e);
    }
  }

  Future signOut() async {
    SharedPreferences shared = await SharedPreferences.getInstance();
    shared.clear();
    await firebaseAuth.signOut();
  }
}
