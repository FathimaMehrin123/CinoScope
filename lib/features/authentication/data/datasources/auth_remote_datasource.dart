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

class AuthRemoteDataSource {
  final FirebaseAuth firebaseAuth;
  final FirebaseFirestore firestore;
  AuthRemoteDataSource(this.firebaseAuth, this.firestore);

  Future<UserModel> login(String email, String password) async {
    final credential = await firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    return UserModel.fromFirebase(credential.user!);
  }

  Future<UserModel> signup(String email, String password) async {
    final credential = await firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    final user = credential.user!;
    await firestore.collection("user").doc(user.uid).set({"email":user.email,"name":"","role":"user",});
    return UserModel.fromFirebase(user);
  }
}
