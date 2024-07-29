import 'package:firebase_auth/firebase_auth.dart';

abstract class IFirebaseLogin {
  Future<UserCredential> login({
    required String email,
    required String password,
  });

  Future<UserCredential> signup({
    required String email,
    required String password,
  });
}
