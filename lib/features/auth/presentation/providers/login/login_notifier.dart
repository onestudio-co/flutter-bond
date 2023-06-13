part of 'login_provider.dart';

class LoginNotifier extends Notifier<LoginState> {
  LoginNotifier(this.authApi);

  final AuthApi authApi;

  @override
  LoginState build() => LoginState.defaults();

  void updateEmail(String email) => state = state.updateEmail(email);

  void updatePassword(String password) =>
      state = state.updatePassword(password);

  void toggleObscured() => state = state.toggleObscured();

  // Implement your login logic here
  void login() async {
    state =
        state.updateLoading(true).resetError().updateValidationErrors(const {});

    final body = {
      'email': state.email,
      'password': state.password,
    };

    try {
      await authApi.login(body);
      appRouter.replaceAll([const MainRoute()]);
    } on ValidationError catch (validationError) {
      state = state
          .updateValidationErrors(validationError.errors)
          .updateError(validationError.message);
    } catch (error) {
      state = state.updateError(error.toString());
    } finally {
      state = state.updateLoading(false);
    }
  }
}
