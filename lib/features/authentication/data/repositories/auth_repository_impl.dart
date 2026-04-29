import 'package:cinescope/features/authentication/domain/entities/user.dart';
import 'package:cinescope/features/authentication/domain/repositories/auth_repository.dart';

import '../datasources/auth_remote_datasource.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remote;
  AuthRepositoryImpl(this.remote);
  @override
  Future<User> login({required String email, required String password}) async {
    return await remote.login(email, password);
  }

  @override
  Future<User> getCurrentUser() {
    // TODO: implement getCurrentUser
    throw UnimplementedError();
  }

  @override
  Future<void> logout() async {
    await remote.logout();
  
  }

  @override
  Future<User> signup({
    required String email,
    required String password,
    required String name,
  }) async {
    // TODO: implement signup
    final usermodel = await remote.signup(email, password, name);
    return usermodel;
  }
}
