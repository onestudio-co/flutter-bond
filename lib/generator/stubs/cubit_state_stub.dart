String cubitStateStub({required String name}) => '''
import 'package:equatable/equatable.dart';

abstract class ${name}State extends Equatable {
  const ${name}State();
}

class Initial${name}State extends ${name}State {
  @override
  List<Object> get props => [];
}
''';
