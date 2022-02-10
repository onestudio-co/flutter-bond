String remoteDataSourceStub({required String name}) => '''
import 'package:fixit/core/api_client.dart';

class ${name}RemoteDataSource {
  final ApiClient _client;

  ${name}RemoteDataSource(this._client);
 }
''';
