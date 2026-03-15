import 'package:bloc/bloc.dart';
import 'package:cinescope/core/session/app_session.dart';
import 'package:cinescope/core/session/session_manager.dart';
import 'package:meta/meta.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  final SessionManager sessionManager;
  AppBloc(this.sessionManager) : super(AppInitial()) {
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
