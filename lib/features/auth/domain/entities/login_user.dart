import 'package:equatable/equatable.dart';

class LocalUser extends Equatable {
  const LocalUser({required this.token});

  final String token;

  @override
  List<Object?> get props => [token];
}
