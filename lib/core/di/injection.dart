import 'package:cinescope/core/bloc/app_bloc.dart';
import 'package:cinescope/core/session/session_manager.dart';
import 'package:cinescope/features/authentication/data/datasources/auth_remote_datasource.dart';
import 'package:cinescope/features/authentication/data/repositories/auth_repository_impl.dart';
import 'package:cinescope/features/authentication/domain/repositories/auth_repository.dart';
import 'package:cinescope/features/authentication/presentation/bloc/auth_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> configureDependencies() async {
  // Firebase
  getIt.registerLazySingleton(() => FirebaseAuth.instance);
  getIt.registerLazySingleton(() => FirebaseFirestore.instance);

  // Auth Remote DataSource
  getIt.registerLazySingleton(
    () =>
        AuthRemoteDataSource(getIt<FirebaseAuth>(), getIt<FirebaseFirestore>()),
  );

  // Auth Repository
  getIt.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(getIt()),
  );

  // Auth Bloc
  getIt.registerFactory(() => AuthBloc(getIt()));
  getIt.registerLazySingleton(() => SessionManager());
  getIt.registerLazySingleton(
    () => AppBloc(getIt<SessionManager>(), getIt<FirebaseAuth>()),
  );
}
