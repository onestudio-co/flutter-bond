import 'package:fixit/core/widgets/dialogs/loading.dart';
import 'package:fixit/features/auth/presentation/widgets/fixit_appbar.dart';
import 'package:fixit/features/auth/presentation/widgets/fixit_button.dart';
import 'package:fixit/features/auth/presentation/widgets/fixit_container_form.dart';
import 'package:fixit/features/auth/presentation/widgets/fixit_divider.dart';
import 'package:fixit/features/auth/presentation/widgets/fixit_text_field.dart';
import 'package:fixit/injection_container.dart';
import 'package:fixit/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

import 'login_cubit.dart';

class LoginPageFixit extends StatelessWidget {
  const LoginPageFixit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginCubitFixit>(
      create: (context) => sl<LoginCubitFixit>(),
      child: Builder(
        builder: (context) {
          final loginFormBloc = context.read<LoginCubitFixit>();

          return Directionality(
            textDirection: TextDirection.rtl,
            child: Scaffold(
              resizeToAvoidBottomInset: false,
              backgroundColor: primaryColor,
              appBar: FixitAppBar(
                title: 'تسجيل الدخول',
                onTapBackButton: () => {},
              ),
              body: FormBlocListener<LoginCubitFixit, String, String>(
                onSubmitting: (context, state) {
                  LoadingDialog.show(context);
                },
                onSuccess: (context, state) {
                  LoadingDialog.hide(context);

                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (_) => const NextScreen()));
                },
                onFailure: (context, state) {
                  LoadingDialog.hide(context);

                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(state.failureResponse!)));
                },
                child: SingleChildScrollView(
                  child: AutofillGroup(
                    child: Column(
                      children: <Widget>[
                        FixitContainerForm(
                          child: Column(
                            children: [
                              FixitTextField(
                                textFormBloc: loginFormBloc.email,
                                hint: 'البريد الالكتروني',
                                autofillHints: 'email',
                                keyboardType: TextInputType.emailAddress,
                              ),
                              const FixitDivider(),
                              FixitTextField(
                                textFormBloc: loginFormBloc.password,
                                suffixButton: SuffixButton.obscureText,
                                autofillHints: 'password',
                                hint: 'كلمة المرور',
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            children: [
                              const Text(
                                'هل نسيت كلمة المرور ؟',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w800),
                              ),
                              TextButton(
                                onPressed: () {},
                                child: const Text(
                                  'اضغط هنا',
                                  style: TextStyle(color: secondaryColor),
                                ),
                              ),
                            ],
                          ),
                        ),
                        FixitButton(
                          title: 'تسجيل الدخول',
                          icon: const Icon(Icons.arrow_forward),
                          onPress: loginFormBloc.submit,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class NextScreen extends StatelessWidget {
  const NextScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const SizedBox(height: 10),
            const Text(
              'Next Page',
              style: TextStyle(fontSize: 54, color: Colors.black),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            ElevatedButton.icon(
              onPressed: () => Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (_) => const LoginPageFixit())),
              icon: const Icon(Icons.replay),
              label: const Text('AGAIN'),
            ),
          ],
        ),
      ),
    );
  }
}



 // Align(
                        //   alignment: Alignment.centerRight,
                        //   child: SizedBox(
                        //     width: 250,
                        //     child: CheckboxFieldBlocBuilder(
                        //       booleanFieldBloc:
                        //           registerFormBloc.showSuccessResponse,
                        //       body: Container(
                        //         alignment: Alignment.centerRight,
                        //         child: const Text('تمت العملية بنجاح'),
                        //       ),
                        //     ),
                        //   ),
                        // ),