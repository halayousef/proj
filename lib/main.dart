import 'dart:async';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_proj/firebase_options.dart';
import 'loginscreen.dart';
import 'signupscreen.dart';

Future<void> main() async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MyApp());
}

class Auth{
  final FirebaseAuth auth = FirebaseAuth.instance;
  User? get currentUser => auth.currentUser;
  Stream<User?> get authStateChanges => auth.authStateChanges();

  Future<void> logInWithEmailAndPAssword(
      {
        required String email,
        required String password
      }
      )
  async{
    await auth.signInWithEmailAndPassword(
        email: email,
        password: password);
  }
  Future<void> createUserWithEmailAndPassword(
      {
      required String email,
      required String password
}
      )
  async{
    await auth.createUserWithEmailAndPassword(
        email: email,
        password: password);
  }

  Future<void> signout()
async {
    await auth.signOut();
}


}



class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      title: 'Hotel Booking System',

      initialRoute: '/',
      routes: {
        '/': (context) => LoginPage(),
        '/signup': (context) => SignUpPage(),
      },
    );
  }
}