import 'package:ecommerce/core/local_storage/i_local_storage.dart';
import 'package:ecommerce/core/state_management/loader_mixin.dart';
import 'package:ecommerce/di/injection.dart';
import 'package:ecommerce/features/signup/models/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SignupProvider with ChangeNotifier, LoaderMixin {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController userNameController = TextEditingController();

  final authService = getIt<FirebaseLogin>();
  final storageService = getIt<LocalStorage>();
  final firestoreService = getIt<FirestoreHandler>();

  Future<void> signup({
    required Function() onSuccess,
    required Function(String errorMsg) onFailure,
  }) async {
    if (!(formKey.currentState?.validate() ?? false)) {
      onFailure('Enter valid data');
      return;
    }

    try {
      isLoading = true;

      final userCredential = await authService.signup(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );

      await firestoreService.storeUserDetails(
        User(
          email: emailController.text.trim(),
          userName: userNameController.text.trim(),
        ),
      );

      final authToken = await userCredential.user?.getIdToken();

      if (authToken != null) {
        await storageService.setString(
          key: LocalStorageKeys.authToken,
          value: authToken,
        );

        onSuccess.call();
      } else {
        onFailure.call('Something went wrong!');
      }
    } catch (err) {
      onFailure.call(err.toString());
    } finally {
      isLoading = false;
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    userNameController.dispose();
    super.dispose();
  }
}
