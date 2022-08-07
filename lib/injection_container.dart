import 'package:one_studio_core/core.dart' as core;

import 'config/app.dart';
import 'features/app/bloc/app_bloc.dart';

App appBloc = App();

Future<void> init() async {
  for (var provider in providers) {
    await provider.register(core.sl);
  }
  core.providers = providers;
}
