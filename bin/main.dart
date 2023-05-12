import 'package:args/args.dart';

void main(List<String> arguments) {
  final parser = ArgParser()
    ..addFlag('help',
        abbr: 'h', negatable: false, help: 'Displays help information.');

  final argsResult = parser.parse(arguments);

  if (argsResult['help'] == true || arguments.isEmpty) {
    _showHelp(parser);
  } else if (argsResult.command?.name == 'make:model') {
    // _createModel(argsResult.command!);
  } else if (argsResult['help'] == true || arguments.isEmpty) {
    _showHelp(parser);
  } else {
    // Handle other commands here
  }
}

void _showHelp(ArgParser parser) {
  print('Flutter Bond CLI');
  print('A command-line tool for managing Flutter Bond projects.\n');
  print('Usage: fbond <command> [arguments]\n');
  print('Commands:');
  print('  help\t\tDisplay help information about the CLI.\n');
  print(parser.usage);
  print(
      '\nFor more information, visit https://github.com/onestudio-co/flutter-bond');
}

Future<void> _createModel(ArgResults command) async {
  final modelName = command['name'] as String?;
  if (modelName == null || modelName.isEmpty) {
    print('Error: Model name is required.');
    return;
  }

  const brickPath = '../bricks/model';
  final outputPath = 'lib/models/$modelName';
  final mason = null;

  final hasBrick = await mason.hasBrick(brickPath);
  if (!hasBrick) {
    print('Error: Model brick not found.');
    return;
  }

  final success = await mason.build(
    brickPath: brickPath,
    outputPath: outputPath,
    variables: {'modelName': modelName},
  );

  if (success) {
    print('Model created successfully at $outputPath.');
  } else {
    print('Error: Failed to create model.');
  }
}
