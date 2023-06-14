extension EmailValidatorExtension on String {
  bool isValidEmail() {
    const pattern =
        r'^[\w-]+(\.[\w-]+)*@[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*(\.[a-zA-Z]{2,})$';

    final regex = RegExp(pattern);
    return regex.hasMatch(this);
  }
}
