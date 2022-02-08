import 'dart:convert';

import 'package:fixit/features/auth/presentation/login/login_cubit.dart';
import 'package:fixit/features/auth/presentation/login/login_state.dart';
import 'package:fixit/injection_container.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../test_helpers.dart';

void main() {
  setUp(() async {
    await mockSetup();
  });

  group('Login cubit tests', () {
    test('initialState should be Empty', () {
      expect(sl<LoginCubit>().state, equals(InitialLoginState()));
    });

    // blocTest(
    //   'should send seen to datasource',
    //   build: ()  {
    //     mockPost(
    //       url: Api.seen(fakeFeatures().data[0]),
    //       status: 200,
    //       response: fakeSuccessResponse(),
    //     );
    //
    //     return sl<FeaturesBloc>();
    //   },
    //   act: (bloc) => bloc.add(FeatureSeenRequested(feature:fakeFeatures().data[0])),
    //   expect: () => [FeaturesLoadSuccess()],
    // );
  });
}

