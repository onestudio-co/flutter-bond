import 'package:bond_core/bond_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app/app.dart';
import 'app/app_run_tasks.dart';
import 'bond_app.dart';

void main() => run(
      () => const ProviderScope(
        child: BondApp(),
      ),
      tasks: RunAppTasks(),
      providers: providers,
    );
