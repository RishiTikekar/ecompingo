class Validators {
  static String? emailValidator(String? textfieldValue) {
    if (textfieldValue == null || textfieldValue.isEmpty) {
      return 'Please enter an email';
    }

    String pattern =
        r'''^[a-zA-Z0-9.a-zA-Z0-9.!#$%&\'*+/=?^_`{|}~-]+@[a-zA-Z0-9]+(?:\.[a-zA-Z0-9]+)*$''';
    RegExp regex = RegExp(pattern);

    if (!regex.hasMatch(textfieldValue)) {
      return 'Enter a valid email address';
    }

    return null;
  }

  static String? passwordValidator(String? textfieldValue) {
    if (textfieldValue == null || textfieldValue.isEmpty) {
      return 'Please enter a password';
    }

    if (textfieldValue.length < 8) {
      return 'Password must be at least 8 characters long';
    }

    if (!RegExp(r'^(?=.*[A-Z])').hasMatch(textfieldValue)) {
      return 'Password must contain at least one uppercase letter';
    }

    if (!RegExp(r'^(?=.*[a-z])').hasMatch(textfieldValue)) {
      return 'Password must contain at least one lowercase letter';
    }

    if (!RegExp(r'^(?=.*\d)').hasMatch(textfieldValue)) {
      return 'Password must contain at least one digit';
    }

    if (!RegExp(r'^(?=.*[@$!%*?&])').hasMatch(textfieldValue)) {
      return 'Password must contain at least one special character (@, \$, !, %, *, ?, &)';
    }
    return null;
  }

  static String? usernameValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a username';
    }

    if (value.length < 3) {
      return 'Username must be at least 3 characters long';
    }

    if (value.length > 16) {
      return 'Username must be no more than 16 characters long';
    }

    return null;
  }
}
