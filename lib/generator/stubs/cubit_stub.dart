String cubitStub({required String name}) => '''
import 'package:bloc/bloc.dart';

import '../data/repositories/${name.toLowerCase()}_repository.dart';
import '${name.toLowerCase()}_state.dart';

class ${name}Cubit extends Cubit<${name}State> {
  final ${name}Repository _${name.toLowerCase()}Repository;

  ${name}Cubit(this._${name.toLowerCase()}Repository) : super(Initial${name}State());

}
''';
