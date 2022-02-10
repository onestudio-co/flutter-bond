String pageStub({required String name}) => '''
import 'package:auto_route/auto_route.dart';
import 'package:fixit/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '${name.toLowerCase()}_cubit.dart';

class ${name}Page extends StatelessWidget implements AutoRouteWrapper {
  const ${name}Page({Key? key}) : super(key: key);
  
   @override
  Widget wrappedRoute(BuildContext context) => BlocProvider<${name}Cubit>(
        create: (BuildContext context) => sl<${name}Cubit>(),
        child: this,
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
      ),
      body: SafeArea(
         child: Container(),
      ),
    );
  }
}
''';
