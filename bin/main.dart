import 'package:args/args.dart';

void main(List<String> arguments) {
  final parser = ArgParser()
    ..addFlag('help',
        abbr: 'h', negatable: false, help: 'Displays help information.');

  final argsResult = parser.parse(arguments);

  if (argsResult['help'] == true || arguments.isEmpty) {
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
