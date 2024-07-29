import 'package:ecommerce/core/firebase/login/i_firebase_login.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseLogin implements IFirebaseLogin {
  final _auth = FirebaseAuth.instance;
  @override
  Future<UserCredential> login({
    required String email,
    required String password,
  }) async {
    return _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  @override
  Future<UserCredential> signup({
    required String email,
    required String password,
  }) async {
    final userCredential = await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    return userCredential;
  }
}
