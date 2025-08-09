import 'package:bloc_tdd_arc/core/utils/type/typedef.dart';
import 'package:bloc_tdd_arc/features/auth/domain/entities/login_user.dart';

class LocalUserModel extends LocalUser {
  const LocalUserModel({required super.token});

  factory LocalUserModel.fromJson(DataMap map) {
    return LocalUserModel(token: map['token'].toString());
  }

  LocalUserModel copyWith({String? token}) {
    return LocalUserModel(token: token ?? this.token);
  }

  DataMap toMap() {
    return {"token": token};
  }
}
