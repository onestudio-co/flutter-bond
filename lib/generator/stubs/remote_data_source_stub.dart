String remoteDataSourceStub({required String name}) => '''
import 'package:bond/core/data_soruce.dart';
import 'package:bond/core/api_client.dart';

class ${name}RemoteDataSource extends DataSource {
  final ApiClient _client;

  ${name}RemoteDataSource(this._client);
 }
''';
