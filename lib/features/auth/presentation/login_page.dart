import 'package:bond/core/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:one_studio_core/core.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          context.localizations.login_page_title,
        ),
      ),
      body: Container(),
    );
  }
}
