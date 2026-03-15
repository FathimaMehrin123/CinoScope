part of 'app_bloc.dart';

@immutable
sealed class AppEvent {}

class AppStarted extends AppEvent {}

class UserLoggedIn extends AppEvent {
  final AppSession session;
  UserLoggedIn(this.session);
}
class UserLoggedOut extends AppEvent{}