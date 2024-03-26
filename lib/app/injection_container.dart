import 'package:bond_core/bond_core.dart' as core;

import 'app.dart';

Future<void> init() async {
  for (var provider in providers) {
    await provider.register(core.sl);
  }
  core.appProviders = providers;
}
