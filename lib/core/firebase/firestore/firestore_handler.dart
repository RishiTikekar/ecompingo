import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/features/signup/models/user.dart';

part 'i_firestore_handler.dart';

class FirestoreHandler implements IFirestoreHandler {
  final _fireStore = FirebaseFirestore.instance;
  @override
  Future<void> storeUserDetails(User userData) async {
    final newUserDoc = _fireStore.collection('users').doc(userData.email);

    await newUserDoc.set(User.toJson(userData));
  }
}
