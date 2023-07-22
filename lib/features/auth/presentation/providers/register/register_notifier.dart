part of 'register_provider.dart';

class RegisterNotifier extends Notifier<RegisterState> {
  RegisterNotifier(this.authApi);

  @override
  RegisterState build() => RegisterState.defaults();
  final AuthApi authApi;

  void updateName(String name) => state = state.updateName(name);

  void updateEmail(String email) => state = state.updateEmail(email);

  void updatePassword(String password) =>
      state = state.updatePassword(password);

  void updatePasswordConfirmation(String confirmPassword) =>
      state = state.updatePasswordConfirmation(confirmPassword);

  void toggleObscured() => state = state.toggleObscured();

  // Implement your register logic here
  void register() async {
    state = state.updateLoading(true);

    // Perform register request...
    try {
      await authApi.register({
        'name': state.name,
        'email': state.email,
        'password': state.password,
        'password_confirmation': state.passwordConfirmation,
      });
      appRouter.replaceAll([const MainRoute()]);
    } on ValidationError catch (validationError) {
      print(validationError);
    } catch (error) {
      print(error);
    } finally {
      state = state.updateLoading(false);
    }
    // Update the state based on the register result
  }
}
