import 'package:bloc/bloc.dart';
import 'package:cinescope/core/bloc/app_bloc.dart';
import 'package:cinescope/core/di/injection.dart';
import 'package:cinescope/core/session/app_session.dart';
import 'package:cinescope/features/authentication/domain/entities/user.dart';
import 'package:cinescope/features/authentication/domain/repositories/auth_repository.dart';
import 'package:flutter/foundation.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository repository;

  AuthBloc(this.repository) : super(AuthInitial()) {
    on<LoginRequested>((event, emit) async {
      emit(AuthLoading());

      try {
        final user = await repository.login(
          email: event.email,
          password: event.password,
        );
        final session = AppSession(user.email, user.id);
        getIt<AppBloc>().add(UserLoggedIn(session));

        emit(Authenticated(user));
      } catch (e) {
        emit(AuthError("Login failed"));
      }
    });

    on<SignupRequested>((event, emit) async {
      emit(AuthLoading());

      try {
        final user = await repository.signup(
          email: event.email,
          password: event.password,
        );
        emit(Authenticated(user));
      } catch (e) {
        emit(AuthError("Signup failed"));
      }
    });
    // on<LogoutRequested>((event, emit) async {
    //   emit(AuthLoading());
    //   try {
    //     await repository.logout();
    //     getIt<AppBloc>().add(UserLoggedOut());
    //     emit(Unauthenticated());
    //   } catch (e) {
    //     emit(AuthError("logout failed"));
    //   }
    // });
  }
}
