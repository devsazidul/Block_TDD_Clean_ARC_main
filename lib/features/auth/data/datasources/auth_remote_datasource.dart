import '../../../../core/errors/exceptions.dart';
import '../../../../core/services/network/network_caller.dart';
import '../models/login_user_model.dart';

abstract class AuthRemoteDataSource {
  const AuthRemoteDataSource();

  Future<LocalUserModel> login({
    required String email,
    required String password,
  });
}


class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  AuthRemoteDataSourceImpl();

  final NetworkCaller _networkCaller = NetworkCaller();

  @override
  Future<LocalUserModel> login({
    required String email,
    required String password,
  }) async {

    final response = await _networkCaller.postRequest(
      'https://reqres.in/api/login',
      body: {
        'email': email,
        'password': password,
      },
      headers: {
        'Content-Type': 'application/json',
        'x-api-key': 'reqres-free-v1',
      },

    );

    if (response.statusCode != 200) { // use response.isSuccess
      // No need to throw unless you want a UI layer to catch it
      throw ServerException(
        message: response.errorMessage.toString(),
        statusCode: response.statusCode,
      );
    }

    final token = LocalUserModel.fromJson(response.responseData);

    return token;
  }
}