// ignore_for_file: unused_field
import 'package:bond/features/auth/data/datasources/auth_local_data_source.dart';
import 'package:bond/features/auth/data/datasources/auth_remote_data_source.dart';

class AuthRepository {
  final AuthRemoteDataSource _remoteDataSource;
  final AuthLocalDataSource _localDataSource;

  AuthRepository(this._remoteDataSource, this._localDataSource);
}
