class SessionManager {
  static final SessionManager _instance = SessionManager._internal();

  factory SessionManager() => _instance;

  SessionManager._internal();

  String? token;
  int isAdmin = 0;
  String userName = '';

  void saveSession({required String tokenValue, required int adminStatus, required String username}) {
    token = tokenValue;
    isAdmin = adminStatus;
    userName = username;
  }

  void clearSession() {
    token = null;
    isAdmin = 0;
  }
}
