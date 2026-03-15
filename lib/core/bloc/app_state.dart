part of 'app_bloc.dart';

@immutable
sealed class AppState {}

final class AppInitial extends AppState {}

class AppAuthenticated extends AppState {
  final AppSession appSession;
  AppAuthenticated(this.appSession);
}
class AppUnauthenticated extends AppState{}