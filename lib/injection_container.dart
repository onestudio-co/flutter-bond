import 'package:get_it/get_it.dart';

import 'config/app.dart';
import 'features/app/bloc/app_bloc.dart';

final sl = GetIt.instance;
AppBloc appBloc = AppBloc(); // initiated at main.dart

Future<void> init() async {
  for (var provider in providers) {
    await provider.register(sl);
  }
}
