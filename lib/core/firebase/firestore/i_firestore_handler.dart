part of 'firestore_handler.dart';

abstract class IFirestoreHandler {
  Future<void> storeUserDetails(User userData);
}
