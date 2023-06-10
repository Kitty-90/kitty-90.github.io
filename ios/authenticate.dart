import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:maths_admin_maths/home.dart';

import 'package:maths_admin_maths/showsnackbarf.dart';



class Authenticate{
  final  _auth;


  Authenticate(this._auth);
  var collection = FirebaseFirestore.instance.collection("user");

  buildcard(Name,Email,uid) async => collection.doc(uid).set({
    "name":Name,
    "Email":Email,
    "user Id":uid,
    "parta":0,
    "partb":0,
    "partc":0,
    "solved":{"0"},
    "solvedb":{"0"},
    "solvedc":{"0"},
  });

  Future<void> loginUpWithEmail({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      UserCredential re=await _auth.signInWithEmailAndPassword(email: email, password: password);

      //sentEmailVerification(context);
      String uid= re.user!.uid;
      //collection.doc(uid).add({"increment":2});
      //await buildcard(email,uid);
      print(uid.toString());




      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Home()));

    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message!);

    }
  }

  Future<void> signUpWithEmail({
    required String name,
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      await sentEmailVerification(context);
      String uid=result.user!.uid;

      print(uid.toString());
      await buildcard(name, email,uid);

      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Home()));
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message!);
    }
  }

  Future<void> sentEmailVerification(BuildContext context) async {
    try {
      _auth.currentUser!.sendEmailVerification();
      showSnackBar(context, "email verification has sent");
    } on FirebaseAuthException
    catch (e) {
      showSnackBar(context, e.message!);
    }
  }


  String? getCurrentUserUid() {
    User? currentUser = _auth.currentUser;
    return currentUser?.uid;
  }
}




