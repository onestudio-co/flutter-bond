import 'package:bloc_test/bloc_test.dart';
import 'package:fixit/core/api_client.dart';
import 'package:fixit/core/constants.dart';
import 'package:fixit/core/models/single_m_response.dart';
import 'package:fixit/features/auth/data/models/user.dart';
import 'package:fixit/features/auth/data/models/user_meta.dart';
import 'package:fixit/features/auth/presentation/login/login_cubit.dart';
import 'package:fixit/features/auth/presentation/login/login_state.dart';
import 'package:fixit/injection_container.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';

import '../../../test_helpers.dart';

@GenerateMocks([ApiClient])
void main() {
  setUp(() async {
    await mockSetup();
  });

  group('Login cubit tests', () {
    test('initialState should be Empty', () {
      expect(sl<LoginCubit>().state, equals(InitialLoginState()));
    });

    var user = User(
      id: 1,
      name: "m",
      mobile: "123",
      email: "123",
      martialStatus: "123",
      dob: "123",
      startedAt: "123",
      gender: "1",
      isVerified: true,
      isActive: true,
      createdAt: DateTime(2022),
      liveAvailable: true,
      scheduleAvailable: true,
    );

    var meta = const UserMeta(
      token: 'token',
      wcToken: 'wcToken',
    );

    blocTest(
      "success login",
      build: () {
        mockPost(
          Api.login(),
          SingleMResponse<User, UserMeta>(user, meta).toJson(),
        );

        return sl<LoginCubit>();
      },
      act: (LoginCubit loginCubit) {
        return loginCubit.loginPressed(
          mobile: "123",
          password: "123456",
        );
      },
      expect: () => [
        LoginLoading(),
        LoginSuccess(user: user),
      ],
    );
  });
}
