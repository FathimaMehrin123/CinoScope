import 'package:bloc/bloc.dart';
import 'package:cinescope/core/session/app_session.dart';
import 'package:cinescope/core/session/session_manager.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  final SessionManager sessionManager;
  final FirebaseAuth firebaseAuth;
  AppBloc(this.sessionManager, this.firebaseAuth) : super(AppInitial()) {
    on<AppStarted>((event, emit) {
      final user = firebaseAuth.currentUser;
      if (user != null) {
        final session = AppSession(user.uid, user.email ?? "");
        sessionManager.saveSession(session);
        emit(AppAuthenticated(session));
      } else {
        emit(AppUnauthenticated());
      }
    });
    on<UserLoggedIn>((event, emit) {
      sessionManager.saveSession(event.session);
      emit(AppAuthenticated(event.session));
    });
    on<UserLoggedOut>((event, emit) {
      sessionManager.clearSession();
      emit(AppUnauthenticated());
    });
  }
}
