import 'package:bloc_tdd_arc/core/services/network/network_caller.dart';
import 'package:bloc_tdd_arc/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:bloc_tdd_arc/features/auth/data/repos/auth_repo_impl.dart';
import 'package:bloc_tdd_arc/features/auth/domain/repos/auth_repo.dart';
import 'package:bloc_tdd_arc/features/auth/domain/usecases/login.dart';
import 'package:bloc_tdd_arc/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:get_it/get_it.dart';

part 'injection_container.main.dart';