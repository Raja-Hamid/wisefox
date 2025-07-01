class Validators {
  // NAME VALIDATION
  static String? validateName(String? name) {
    final n = name?.trim() ?? '';
    if (n.isEmpty) {
      return 'Name is required';
    }
    if (n.length < 2) {
      return 'Name is too short';
    }
    if (!RegExp(r"^[a-zA-Z\s'.-]+$").hasMatch(n)) {
      return 'Please enter a valid name';
    }
    return null;
  }

  // EMAIL VALIDATION
  static String? validateEmail(String? email) {
    final e = email?.trim() ?? '';
    if (e.isEmpty) {
      return 'Email is required';
    }
    if (!RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w]{2,4}$").hasMatch(e)) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  // PASSWORD VALIDATION
  static String? validatePassword(String? password) {
    final p = password?.trim() ?? '';
    if (p.isEmpty) {
      return 'Password is required';
    }
    if (p.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }

  // CONFIRM PASSWORD VALIDATION
  static String? validateConfirmPassword(String? password, String? confirm) {
    final p = password?.trim() ?? '';
    if (p != confirm) {
      return 'Passwords do not match';
    }
    return null;
  }
}
