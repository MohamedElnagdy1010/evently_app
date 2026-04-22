class ValidationUtils {
  static bool validateEmptyText(String? value) {
    if (value == null || value.isEmpty) {
      return false;
    } else {
      return true;
    }
  }

  static bool validateEmail(String value) {
    final bool emailValid = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
    ).hasMatch(value);
    return emailValid;
  }

  static bool validatePassword(String value) {
    if (value.length < 5) {
      return false;
    } else {
      return true;
    }
  }
}