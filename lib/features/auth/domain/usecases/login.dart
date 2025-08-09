import 'package:bloc_tdd_arc/core/usecases/usecases.dart';
import 'package:bloc_tdd_arc/features/auth/domain/entities/login_user.dart';
import 'package:bloc_tdd_arc/features/auth/domain/repos/auth_repo.dart';
import 'package:equatable/equatable.dart';
import '../../../../core/utils/type/typedef.dart';

class Login extends UseCaseWithParams<LocalUser, LoginParams> {
  const Login(this._repo);
  final AuthRepo _repo;

  @override
  ResultFuture<LocalUser> call(LoginParams params) =>
      _repo.login(email: params.email, password: params.password);
}

class LoginParams extends Equatable {
  const LoginParams({required this.email, required this.password});

  final String email;
  final String password;

  @override
  List<Object?> get props => [email, password];
}
