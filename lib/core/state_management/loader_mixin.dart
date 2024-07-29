import 'package:flutter/material.dart';

mixin LoaderMixin on ChangeNotifier {
  var _isLoading = false;

  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }
}
