import 'package:bloc_test/bloc_test.dart';
import 'package:fixit/core/constants.dart';
import 'package:fixit/core/models/single_m_response.dart';
import 'package:fixit/features/auth/data/models/user.dart';
import 'package:fixit/features/auth/data/models/user_meta.dart';
import 'package:fixit/features/auth/presentation/login/login_cubit.dart';
import 'package:fixit/features/auth/presentation/login/login_state.dart';
import 'package:fixit/injection_container.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../test_helpers.dart';
import 'Factories/UserFactory.dart';
import 'factories/UserMetaFactory.dart';

void main() {
  setUp(() async {
    mockPackageInfo();
    mockSharedPreferences();
    await mockSetup();
  });

  group('Login cubit tests', () {
    test('initialState should be Empty', () {
      expect(sl<LoginCubit>().state, equals(InitialLoginState()));
    });

    var user = UserFactory.create(id: 1, mobile: "123");
    var meta = UserMetaFactory.create();

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
