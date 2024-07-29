import 'package:ecommerce/core/state_management/loader_mixin.dart';
import 'package:ecommerce/di/injection.dart';
import 'package:flutter/material.dart';

class LoginProvider with ChangeNotifier, LoaderMixin {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final firebaseAuthService = getIt<FirebaseLogin>();
  final storageService = getIt<LocalStorage>();

  LoginProvider();

  Future<void> login({
    required Function() onSuccess,
    required Function(String errorMsg) onFailure,
  }) async {
    if (!(formKey.currentState?.validate() ?? false)) {
      onFailure('Enter valid data');
      return;
    }

    try {
      isLoading = true;
      final userCredential = await firebaseAuthService.login(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
      final authToken = await userCredential.user?.getIdToken();

      if (authToken != null) {
        storageService.setString(
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

  Future<void> logout(
    VoidCallback onSuccess,
  ) async {
    try {
      await storageService.clearData();
      onSuccess.call();
    } catch (err) {
      //
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
