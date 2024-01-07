// ignore_for_file: non_constant_identifier_names

class SessionController {
  static final SessionController _session = SessionController._internel();

  static double screenWidth = 0;
  static double screenHeight = 0;

  factory SessionController() {
    return _session;
  }
  SessionController._internel();
}
