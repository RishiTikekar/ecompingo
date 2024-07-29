import 'package:ecommerce/core/state_management/loader_mixin.dart';
import 'package:ecommerce/di/injection.dart';
import 'package:flutter/material.dart';

class SplashProvider with ChangeNotifier, LoaderMixin {
  bool isLoggedIn = false;
  SplashProvider() {
    init();
  }
  final _storageService = getIt<LocalStorage>();

  Future<void> init() async {
    try {
      isLoading = true;
      await Future.delayed(
        const Duration(milliseconds: 500),
      );

      final authToken = await _storageService.getString(
        LocalStorageKeys.authToken,
      );

      isLoggedIn = authToken?.isNotEmpty ?? false;
    } catch (err) {
      //
    } finally {
      isLoading = false;
    }
  }
}
