import 'package:auto_route/auto_route.dart';
import 'package:fixit/features/auth/presentation/login/login_bloc.dart';
import 'package:fixit/features/auth/presentation/login/success_page.dart';
import 'package:fixit/features/auth/presentation/widgets/custom_elevatedbutton_widget.dart';
import 'package:fixit/features/auth/presentation/widgets/custom_textfield_widget.dart';
import 'package:fixit/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<LoginFormBloc>(),
      child: Builder(
        builder: (context) {
          final formBloc = BlocProvider.of<LoginFormBloc>(context);
          return Theme(
              data: Theme.of(context).copyWith(
                inputDecorationTheme: InputDecorationTheme(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              child: Scaffold(
                appBar: AppBar(title: const Text('Login Page')),
                floatingActionButton: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    FloatingActionButton.extended(
                      heroTag: null,
                      onPressed: formBloc.addErrors,
                      icon: const Icon(Icons.error_outline),
                      label: const Text('ADD ERRORS'),
                    ),
                  ],
                ),
                body: FormBlocListener<LoginFormBloc, String, String>(
                  onSubmitting: (context, state) {
                    //   LoadingDialog.show(context);
                  },
                  onSuccess: (context, state) {
                    //    LoadingDialog.hide(context);
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (_) => const SuccessScreen()));
                  },
                  onFailure: (context, state) {
                    //  LoadingDialog.hide(context);
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(state.failureResponse!)));
                  },
                  child: SingleChildScrollView(
                    physics: const ClampingScrollPhysics(),
                    child: Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Column(
                        children: <Widget>[
                          CustomTextFeildBlocWidget(
                              controller: formBloc.email,
                              icon: const Icon(Icons.email),
                              label: 'Email'),
                          CustomTextFeildBlocWidget(
                            icon: const Icon(Icons.lock),
                            label: 'Password',
                            controller: formBloc.password,
                            suffixButton: SuffixButton.obscureText,
                          ),
                          const SizedBox(height: 12),
                          Container(
                            width: double.infinity,
                            margin: const EdgeInsets.symmetric(horizontal: 8),
                            child: CustomElevatedButton(
                              onPressed: formBloc.submit,
                              child: Text('SUBMIT'),
                            ),
                          ),
                          const SizedBox(height: 50),
                        ],
                      ),
                    ),
                  ),
                ),
              ));
        },
      ),
    );
  }
}
