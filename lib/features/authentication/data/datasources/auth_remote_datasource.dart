//Handles Firebase API.

// Example responsibilities:

// Signup user
// Login user
// Logout
// Get current user
// Send email verification
// Reset password

import 'package:cinescope/features/authentication/data/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:developer';

class AuthRemoteDataSource {
  final FirebaseAuth firebaseAuth;
  final FirebaseFirestore firestore;
  AuthRemoteDataSource(this.firebaseAuth, this.firestore);

  Future<UserModel> login(String email, String password) async {
    try {
      final credential = await firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      return UserModel.fromFirebase(credential.user!);
    } catch (e, stackTrace) {
      log(" Login error", error: e, stackTrace: stackTrace);
      rethrow; // 🔥 IMPORTANT
    }
  }

  Future<UserModel> signup(String email, String password, String name) async {
    try {
      print(" Creating user");

      final credential = await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      final user = credential.user!;
      print(" Auth success: ${user.uid}");

      print(" Writing to Firestore");

      await firestore.collection("user").doc(user.uid).set({
        "email": user.email,
        "name": name,
        "role": "user",
      });

      print(" Firestore write success");

      return UserModel.fromFirebase(user);
    } catch (e, stackTrace) {
      print(" DataSource Signup error: $e");
      print(stackTrace);
      rethrow; // 🔥 VERY IMPORTANT
    }
  }

 

Future<void> logout() async {
  try {
    await firebaseAuth.signOut();
    log(" Logout successful");
  } catch (e, stackTrace) {
    log(" Logout error", error: e, stackTrace: stackTrace);
    rethrow; // optional but recommended
  }
}
}
