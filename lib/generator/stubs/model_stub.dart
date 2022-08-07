String modelStub({String? modelName}) => '''
import 'package:taleb/core/models/model.dart';

class $modelName extends Model{
   const $modelName({required int id}) : super(id: id);
 }
''';
