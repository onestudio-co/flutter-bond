import 'package:bond/routes/app_router.dart';
import 'package:one_studio_core/core.dart';

import 'app/app_run_tasks.dart';
import 'bond_app.dart';

void main() => run(BondApp(appRouter: sl<AppRouter>()), RunAppTasks());
