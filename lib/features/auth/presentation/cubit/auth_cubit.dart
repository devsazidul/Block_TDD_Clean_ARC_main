import 'package:bloc_tdd_arc/features/auth/domain/entities/login_user.dart';
import 'package:bloc_tdd_arc/features/auth/domain/usecases/login.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit({required Login login})
    : _login = login,
      super(const AuthInitial());

  final Login _login;


  // login
  Future<void> login({required String email, required String password}) async {
    emit(const AuthLoading());
    final result = await _login(LoginParams(email: email, password: password));

    result.fold(
          (failure) {
        emit(Error(message: failure.message, statusCode: failure.statusCode));
      },
          (user) {
        emit(LoggedIn(user: user));
      },
    );
  }
}
