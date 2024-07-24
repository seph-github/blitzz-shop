import 'package:blitzz_shop/utils/app_string.dart';

class ValidatorServices {
  ValidatorServices._();

  static String? emailValidator(String? value) {
    RegExp emailRegex = RegExp(r'^([\w\.\-]+)@([\w\-]+)((\.(\w){2,3})+)$');
    final isEmailValid = emailRegex.hasMatch(value!);
    if (!isEmailValid) {
      return 'Invalid email address';
    } else if (value.isEmpty) {
      return 'Email address is required';
    }
    return null;
  }

  static String? shopNameValidator(String? value) {
    if (value!.isEmpty) {
      return fieldRequired;
    } else if (value.length < 3 || value.length > 32) {
      return shopNameCharExceed;
    } else {
      return null;
    }
  }

  static String? phoneNumberValidator(String? value) {
    if (value!.isEmpty) {
      return fieldRequired;
    }
    return null;
  }

  static String? requiredFieldValidator(String? value) {
    if (value!.isEmpty) {
      return fieldRequired;
    }
    return null;
  }

  static String? shortRequiredFieldValidator(String? value) {
    if (value!.isEmpty) {
      return shortRequiredValidator;
    }
    return null;
  }

  static String? passwordValidator(String? value) {
    if (value!.isEmpty) {
      return fieldRequired;
    }
    return null;
  }

  static String? confirmPasswordValidator(
    String? value, {
    required String? otherValue,
  }) {
    if (value != otherValue) {
      return 'Password didn\'t match';
    } else if (value!.isEmpty) {
      return fieldRequired;
    }
    return null;
  }
}
