import '../../app/constants.dart';

class FormValidations {
  static final emailRegex = RegExp(
    r'^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$',
  );
  static final passwordRegex = RegExp(
    r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$',
  );

  static String? required(String? text) {
    if (text == null) return null;
    text = text.trim();
    if (text.isEmpty) return 'This field is required';
    return null;
  }

  static String? longInput(String? text) {
    if (text == null) return null;
    text = text.trim();
    if (text.isEmpty) return 'This field is required';
    if (text.length < 3) return 'Input is too short';
    return null;
  }

  static String? bio(String? text) {
    if (text == null) return null;
    text = text.trim();
    if (text.isEmpty) return 'This field is required';
    if (text.length < AppConstants.bioMinCount) return 'Input is too short';
    if (text.length >= AppConstants.bioMaxCount) return 'Max character limit reached';
    return null;
  }

  static String? email(String? text) {
    if (text == null) return null;
    text = text.trim();
    if (text.isEmpty) return 'This field is required';
    if (emailRegex.hasMatch(text) == false) return 'Enter a valid email address';
    return null;
  }

  static String? password(String? text) {
    if (text == null) return null;
    text = text.trim();
    if (text.isEmpty) return 'This field is required';
    if (passwordRegex.hasMatch(text) == false) {
      return 'Password must have least 8 characters and contain capital letters and numbers';
    }
    return null;
  }

  static String? confirmPassword(String? text, String password) {
    if (text == null) return null;
    text = text.trim();
    if (text.isEmpty) return 'This field is required';
    if (text != password) return 'Passwords do not match';
    return null;
  }

  static String? number(String? text, {bool integer = false}) {
    if (text == null) return null;
    text = text.trim();
    if (text.isEmpty) return 'This field is required';
    final value = integer ? int.tryParse(text) : double.tryParse(text);
    if (value == null) return 'Enter a valid ${integer ? 'integer' : 'number'}';
    return null;
  }

  static String? integer(String? text) => number(text, integer: true);
}
