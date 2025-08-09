import 'package:bloc_tdd_arc/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:bloc_tdd_arc/features/auth/domain/repos/auth_repo.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/utils/type/typedef.dart';
import '../../domain/entities/login_user.dart';

class AuthRepoImpl implements AuthRepo {
  const AuthRepoImpl(this._remoteDataSource);
  final AuthRemoteDataSource _remoteDataSource;

  @override
  ResultFuture<LocalUser> login({
    required String email,
    required String password,
  }) async {
    try {
      final user = await _remoteDataSource.login(
        email: email,
        password: password,
      );
      return Right(user);
    } on ServerException catch (e) {
      return Left(ServerFailure.fromException(e));
    }
  }
}