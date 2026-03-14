// DTO stands for Data Transfer Object.

// It’s a simple object used to carry data between different parts of an application—for example, between your Flutter app and a backend API, or between layers like the data source and the domain layer.

// // UserDto is just a container for data received from an API. Later, you might convert it to a domain User entity that contains business logic.

import 'package:cinescope/features/authentication/domain/entities/user.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;

class UserModel extends User {

  UserModel({
    required super.id,
    required super.email,
    required super.name,
  });

  factory UserModel.fromFirebase(firebase_auth.User firebaseUser) {

    return UserModel(
      id: firebaseUser.uid,
      email: firebaseUser.email ?? "",
      name: firebaseUser.displayName ?? "",
    );

  }

//UserModel.fromFirebase
}
