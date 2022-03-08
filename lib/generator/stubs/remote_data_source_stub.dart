String remoteDataSourceStub({required String name}) => '''
import 'package:fixit/core/data_soruce.dart';
import 'package:fixit/core/api_client.dart';

class ${name}RemoteDataSource extends DataSource{
  final ApiClient _client;

  ${name}RemoteDataSource(this._client);
 }
''';
