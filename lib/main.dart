import 'package:bond/features/app/app_bloc.dart';
import 'package:bond_core/bond_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app/app.dart';
import 'app/app_run_tasks.dart';
import 'bond_app.dart';

void main() => run(
      () => ProviderScope(
        child: BlocProvider<AppBloc>(
          create: (context) => sl<AppBloc>(),
          child: const BondApp(),
        ),
      ),
      tasks: RunAppTasks(),
      providers: providers,
    );
