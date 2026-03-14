part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

class LoginRequested extends AuthEvent {
  final String email;
  final String password;
  LoginRequested(this.email, this.password);
}

class SignupRequested extends AuthEvent {
  final String email;
  final String password;
  final String name;

  SignupRequested(this.email, this.password, this.name);
  
}

class LogoutRequested  extends AuthEvent{}