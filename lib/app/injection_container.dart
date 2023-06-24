import 'package:bond_core/bond_core.dart' as core;

import '../config/app.dart';

Future<void> init() async {
  for (var provider in providers) {
    await provider.register(core.sl);
  }
  core.providers = providers;
}
