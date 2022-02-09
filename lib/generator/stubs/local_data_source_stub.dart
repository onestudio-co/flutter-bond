String localDataSourceStub({required String name, required String model}) => '''
import 'package:shared_preferences/shared_preferences.dart';

import '../models/${model.toLowerCase()}.dart';

class ${name}LocalDataSource {
  final SharedPreferences _sharedPreferences;

  ${name}LocalDataSource(this._sharedPreferences);
  
  Future<bool> insert($model ${model.toLowerCase()}) => Future.value(false);
  
  Future<List<$model>> get() => Future.value([]);
  
  Future<bool> delete($model ${model.toLowerCase()}) => Future.value(false);
 }
''';
