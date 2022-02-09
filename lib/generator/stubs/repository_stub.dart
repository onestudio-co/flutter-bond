String repositoryStub({required String name}) => '''
import '../data_sources/${name.toLowerCase()}_local_data_source.dart';
import '../data_sources/${name.toLowerCase()}_remote_data_source.dart';

class ${name}Repository {
  final ${name}RemoteDataSource _remoteDataSource;
  final ${name}LocalDataSource _localDataSource;

  ${name}Repository(this._remoteDataSource, this._localDataSource);
}
''';
