class RegisterValidation {
  String validateEmail(String email) {
    if (email == null || email.isEmpty) return 'enter email address';
    const pattern = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
    RegExp regExp = RegExp(pattern);
    if (!regExp.hasMatch(email)) return 'check your email address';
    return null;
  }

  String validateName(String name) {
    if (name == null || name.isEmpty) return 'enter your name';
    const pattern =
        r'^[a-zA-Z0-9]([._-](?![._-])|[a-zA-Z0-9]){3,18}[a-zA-Z0-9]$';
    RegExp regExp = RegExp(pattern);
    if (!regExp.hasMatch(name)) return 'check your username';
    return null;
  }

  String validatePassword(String password) {
    if (password == null || password.isEmpty) return 'enter password';
    const pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$ %^&*-]).{8,}$';
    RegExp regExp = RegExp(pattern);
    if (!regExp.hasMatch(password)) return 'check your password';
    return null;
  }

  String validateCommunity(dynamic community) {
    if (community == -1) return 'select commuity';
    return null;
  }
}
