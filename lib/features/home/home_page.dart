import 'package:auto_route/src/router/auto_router_x.dart';
import 'package:fixit/routes/app_router.dart';
import 'package:fixit/features/auth/data/repositories/auth_repository.dart';
import 'package:fixit/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:fixit/features/auth/presentation/bloc/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../injection_container.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => sl<AuthBloc>(),
      child: BlocListener(
        listener: _listener,
        child: Center(
            child: TextButton(
          onPressed: () {
            sl<AuthRepository>().logout('all');
          },
          child: const Text('Logout'),
        )),
      ),
    );
  }

  void _listener(BuildContext context, state) {
    if (state is LogoutSuccess) {
      context.router.popAndPush(const LoginRoute());
    }
  }
}
