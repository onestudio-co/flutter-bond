import 'package:bond/routes/app_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:one_studio_core/core.dart';

import 'app/app_run_tasks.dart';
import 'bond_app.dart';
import 'features/app/app_bloc.dart';

void main() => run(
      () => BlocProvider<AppBloc>(
        create: (context) => sl<AppBloc>(),
        child: ProviderScope(
          child: BondApp(
            appRouter: sl<AppRouter>(),
          ),
        ),
      ),
      RunAppTasks(),
    );
