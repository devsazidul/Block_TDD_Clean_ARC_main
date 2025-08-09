import 'package:bloc_tdd_arc/core/utils/type/typedef.dart';
import 'package:bloc_tdd_arc/features/auth/domain/entities/login_user.dart';

abstract class AuthRepo {
  const AuthRepo();

  ResultFuture<LocalUser> login({
    required String email,
    required String password,
  });
}