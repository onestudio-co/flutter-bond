import 'package:bond/features/app/app_bloc.dart';
import 'package:bond/routes/app_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:one_studio_core/core.dart';

import 'app/app_run_tasks.dart';
import 'bond_app.dart';

void main() => run(
      () => ProviderScope(
        child: BlocProvider<AppBloc>(
          create: (context) => sl<AppBloc>(),
          child: BondApp(
            appRouter: sl<AppRouter>(),
          ),
        ),
      ),
      RunAppTasks(),
    );
