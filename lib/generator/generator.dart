import 'dart:io';

import 'package:args/args.dart';
import 'package:collection/collection.dart' show IterableExtension;
import 'package:fixit/generator/strings.dart';

import 'console.dart';
import 'menu.dart';
import 'ny_command.dart';
import 'stubs/cubit_state_stub.dart';
import 'stubs/cubit_stub.dart';
import 'stubs/local_data_source_stub.dart';
import 'stubs/model_stub.dart';
import 'stubs/page_stub.dart';
import 'stubs/remote_data_source_stub.dart';
import 'stubs/repository_stub.dart';
import 'stubs/service_provider_stub.dart';

final ArgParser parser = ArgParser(allowTrailingOptions: true);

List<NyCommand> _allCommands = [
  NyCommand(
      name: "feature",
      options: 2,
      arguments: ["-m", '-name'],
      category: "make",
      action: _feature),
];

void main(List<String> arguments) {
  commands(arguments.toList());
}

Future<void> commands(List<String> arguments) async {
  if (arguments.isEmpty) {
    MetroConsole.writeInBlack(metroMenu);
    return;
  }

  List<String> argumentSplit = arguments[0].split(":");

  if (argumentSplit.isEmpty || argumentSplit.length <= 1) {
    MetroConsole.writeInBlack('Invalid arguments ' + arguments.toString());
    exit(2);
  }

  String type = argumentSplit[0];
  String action = argumentSplit[1];

  NyCommand? nyCommand = _allCommands.firstWhereOrNull(
      (command) => type == command.category && command.name == action);

  if (nyCommand == null) {
    MetroConsole.writeInBlack('Invalid arguments ' + arguments.toString());
    exit(1);
  }

  arguments.removeAt(0);
  await nyCommand.action!(arguments);
}

// data-> models/feature_name_model
//       -> data_sources/feature_name_remote_data_source
//                    /feature_name_local_data_source
//       -> repos/feature_name_repo
// presentation -> controller->feature_name_controller
//                controller->feature_name_page

_feature(List<String> arguments) async {
  parser.addOption(customModelNameOption,
      abbr: 'm', help: 'create custom model');

  final ArgResults argResults = parser.parse(arguments);

  String? featureName = argResults.arguments.firstOrNull;
  if (featureName == null) {
    MetroConsole.writeInGreen('you should pass the feature name 😒');
  }

  String? customModel = argResults[customModelNameOption];

  await makeFeature(featureName: featureName!, customModel: customModel);

  MetroConsole.writeInGreen('$featureName feature created 🎉');
}

Future makeFeature({required String featureName, String? customModel}) async {
  String featureFolderPath = '$featuresFolder/${featureName.toLowerCase()}';
  await _makeDirectory(featuresFolder);
  await _makeDirectory(featureFolderPath);

  String featureDataFolderPath = '$featureFolderPath/data';
  await _makeDirectory(featureDataFolderPath);

  String featureModelsFolderPath = '$featureDataFolderPath/models';
  String modelName = customModel ?? featureName;
  String featureModelFilePath =
      '$featureModelsFolderPath/${modelName.toLowerCase()}.dart';
  await _makeDirectory(featureModelsFolderPath);
  await _createNewFile(
      featureModelFilePath, modelStub(modelName: modelName.toTitleCase()));

  String featureDataSourcesFolderPath = '$featureDataFolderPath/data_sources';
  await _makeDirectory(featureDataSourcesFolderPath);

  String featureRemoteDataSourceFilePath =
      '$featureDataSourcesFolderPath/${featureName}_remote_data_source.dart';
  await _createNewFile(featureRemoteDataSourceFilePath,
      remoteDataSourceStub(name: featureName.toTitleCase()));

  String featureLocalDataSourceFilePath =
      '$featureDataSourcesFolderPath/${featureName}_local_data_source.dart';
  await _createNewFile(
      featureLocalDataSourceFilePath,
      localDataSourceStub(
          name: featureName.toTitleCase(), model: modelName.toTitleCase()));

  String featureRepositoriesFolderPath = '$featureDataFolderPath/repositories';
  await _makeDirectory(featureRepositoriesFolderPath);

  String featureRepositoryFilePath =
      '$featureRepositoriesFolderPath/${featureName}_repository.dart';
  await _createNewFile(featureRepositoryFilePath,
      repositoryStub(name: featureName.toTitleCase()));

  String featurePresentationFolderPath = '$featureFolderPath/presentation';
  await _makeDirectory(featurePresentationFolderPath);

  String featureCubitStateFilePath =
      '$featurePresentationFolderPath/${featureName}_state.dart';
  await _createNewFile(featureCubitStateFilePath,
      cubitStateStub(name: featureName.toTitleCase()));

  String featureCubitFilePath =
      '$featurePresentationFolderPath/${featureName}_cubit.dart';
  await _createNewFile(
      featureCubitFilePath, cubitStub(name: featureName.toTitleCase()));

  String featurePageFilePath =
      '$featurePresentationFolderPath/${featureName}_page.dart';
  await _createNewFile(
      featurePageFilePath, pageStub(name: featureName.toTitleCase()));

  String featureServiceProviderFilePath =
      '$featureFolderPath/${featureName}_service_provider.dart';
  await _createNewFile(featureServiceProviderFilePath,
      serviceProviderStub(name: featureName.toTitleCase()));
}

/// Creates a new file from a [path] and [value].
_createNewFile(String path, String value) async {
  final File file = File(path);
  await file.writeAsString(value);
}

/// Creates a new directory from a [path] if it doesn't exist.
_makeDirectory(String path) async {
  Directory directory = Directory(path);
  if (!(await directory.exists())) {
    await directory.create();
  }
}

extension StringCasingExtension on String {
  String toCapitalized() =>
      length > 0 ? '${this[0].toUpperCase()}${substring(1).toLowerCase()}' : '';
  String toTitleCase() => replaceAll(RegExp(' +'), ' ')
      .split(' ')
      .map((str) => str.toCapitalized())
      .join(' ');
}
