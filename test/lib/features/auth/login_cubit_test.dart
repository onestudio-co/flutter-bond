import 'package:bloc_test/bloc_test.dart';
import 'package:fixit/core/constants.dart';
import 'package:fixit/core/errors/failures.dart';
import 'package:fixit/core/models/single_m_response.dart';
import 'package:fixit/features/auth/data/models/user.dart';
import 'package:fixit/features/auth/data/models/user_meta.dart';
import 'package:fixit/features/auth/presentation/login/login_cubit.dart';
import 'package:fixit/features/auth/presentation/login/login_state.dart';
import 'package:fixit/injection_container.dart';
import 'package:fixit/routes/app_router.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../test_helpers.dart';
import 'factories/user_factory.dart';
import 'factories/user_meta_factory.dart';

@GenerateMocks([AppRouter])
void main() {
  setUp(() async {
    mockPackageInfo();
    mockSharedPreferences();
    await mockSetup();
  });

  group('Login cubit tests', () {
    var user = UserFactory.create();
    var userMeta = UserMetaFactory.create();

    test('initial state should be InitialLoginState', () {
      expect(sl<LoginCubit>().state, equals(const LoginState.initial()));
    });

    blocTest(
      "success login must emits [LoginState.loading(),LoginState.success()]",
      setUp: () {
        when(appRouter.pop(true)).thenAnswer((_) async => true);
        mockApiClient.fakePost(
          Api.login(),
          SingleMResponse<User, UserMeta>(user, userMeta).toJson(),
        );
      },
      build: () => sl<LoginCubit>(),
      act: (LoginCubit loginCubit) {
        loginCubit.loginMobileChanged('123');
        loginCubit.loginPasswordChanged('123456');
        return loginCubit.loginSubmitted();
      },
      expect: () => [
        const LoginState.initial(
          mobile: InputField.value('123'),
        ),
        const LoginState(
          status: LoginFormStatus.valid(),
          mobile: InputField.value('123'),
          password: InputField.value('123456'),
        ),
        const LoginState(
          status: LoginFormStatus.loading(),
          mobile: InputField.value('123'),
          password: InputField.value('123456'),
        ),
        LoginState(
          status: LoginFormStatus.success(user: user),
          mobile: const InputField.value('123'),
          password: const InputField.value('123456'),
        ),
      ],
    );

    blocTest(
      "failed login must emits [LoginLoading,LoginFailed]",
      setUp: () {
        mockApiClient.fakePost(
          Api.login(),
          "{ \"message\": \"Login Failed\" }",
          statusCode: 403,
        );
      },
      build: () => sl<LoginCubit>(),
      act: (LoginCubit loginCubit) {
        loginCubit.loginMobileChanged('123');
        loginCubit.loginPasswordChanged('123456');
        return loginCubit.loginSubmitted();
      },
      expect: () => [
        const LoginState.initial(
          mobile: InputField.value('123'),
        ),
        const LoginState(
          status: LoginFormStatus.valid(),
          mobile: InputField.value('123'),
          password: InputField.value('123456'),
        ),
        const LoginState(
          status: LoginFormStatus.loading(),
          mobile: InputField.value('123'),
          password: InputField.value('123456'),
        ),
        const LoginState(
          status: LoginFormStatus.failure(
            failure:
                ServerFailure(error: {'message': 'Login Failed'}, code: 403),
          ),
          mobile: InputField.value('123'),
          password: InputField.value('123456'),
        ),
      ],
    );
  });
}
