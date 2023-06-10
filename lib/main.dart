import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:maths_admin_maths/signup.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(
    options:FirebaseOptions(apiKey: "AIzaSyCjWlo48Bg7W1UZsiPUZqNoTJNExl0nvy0",
        appId: "1:315570927071:web:dd8d4816767dab953b806a",
        messagingSenderId: "315570927071", projectId: "maths333-eb43e" )
  );
  runApp( MaterialApp(home:MyApp()));
}
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body:SignUp(),
    );
  }
}


