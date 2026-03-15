import 'package:cinescope/core/session/app_session.dart';

class SessionManager {

  AppSession? _session;

  AppSession? get session => _session;

  void saveSession(AppSession session) {
    _session = session;
  }

  void clearSession() {
    _session = null;
  }

}