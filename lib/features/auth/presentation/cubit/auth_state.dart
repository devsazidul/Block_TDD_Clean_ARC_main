part of 'auth_cubit.dart';

sealed class AuthState extends Equatable {
  const AuthState();
  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {
  const AuthInitial();
}

class AuthLoading extends AuthState {
  const AuthLoading();
}

class LoggedIn extends AuthState {
  const LoggedIn({required this.user});
  final LocalUser user;

  @override
  List<Object> get props => [user];
}

class LoggedOut extends AuthState {
  const LoggedOut();
}

class Error extends AuthState {
  const Error({required this.message, required this.statusCode});
  final String message;
  final dynamic statusCode;

  @override
  List<String> get props => [message];
}
