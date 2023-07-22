part of 'register_provider.dart';

class RegisterNotifier extends Notifier<RegisterState> {
  @override
  RegisterState build() => RegisterState.defaults();

  void updateName(String name) => state = state.updateName(name);

  void updateEmail(String email) => state = state.updateEmail(email);

  void updatePassword(String password) =>
      state = state.updatePassword(password);

  void updatePasswordConfirmation(String confirmPassword) =>
      state = state.updatePasswordConfirmation(confirmPassword);

  void toggleObscured() => state = state.toggleObscured();

  void toggleObscuredConfirm() => state = state.toggleObscuredConfirm();

  // Implement your register logic here
  void register() async {
    state = state.updateLoading(true);

    // Perform register request...

    // Update the state based on the register result
  }
}
