import 'package:beta/output/warehouse.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Authorizations {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // register user
  Future<String> registerUser({
    required String email,
    required String password,
    required String username,
    required Uint8List file,
  }) async {
    String response = "Error";
    try {
      if (email.isNotEmpty ||
          password.isNotEmpty ||
          username.isNotEmpty ||
          file != null) {
        // register the user
        UserCredential credential = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);
        print(credential.user!.uid);

        String proWareHouse().upImage('profilePic', file, false)

        // add user to database
        _firestore.collection('users').doc(credential.user!.uid).set({
          'username': username,
          'uid': credential.user!.uid,
          'email': email,
          'followers': [],
          'following': [],
        });
        response = 'success';
      }
    } catch (err) {
      response = err.toString();
    }
    return response;
  }
}
