part of 'injection_container.dart';

final sl = GetIt.instance;

Future<void> init() async {
  await _authInit();
}

Future<void> _authInit() async {
  sl
    ..registerLazySingleton<NetworkCaller>(() => NetworkCaller())
    ..registerFactory(() => AuthCubit(login: sl()))
    ..registerLazySingleton(() => Login(sl()))
      ..registerLazySingleton<AuthRepo>(() => AuthRepoImpl(sl()))
      ..registerLazySingleton<AuthRemoteDataSource>(() => AuthRemoteDataSourceImpl());
}
