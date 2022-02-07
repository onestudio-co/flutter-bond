import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:fixit/core/api_client.dart';
import 'package:fixit/core/constants.dart';
import 'package:fixit/core/data_soruce.dart';
import 'package:fixit/core/extension.dart';
import 'package:fixit/core/models/list_response.dart';
import 'package:fixit/core/models/single_m_response.dart';
import 'package:fixit/core/models/single_response.dart';
import 'package:fixit/core/models/success_response.dart';
import 'package:fixit/core/utils.dart';
import 'package:fixit/features/profile/data/models/profile_meta.dart';

import '../dto/complete_registration.dart';
import '../dto/social_account_user.dart';
import '../models/country.dart';
import '../models/user.dart';
import '../models/user_meta.dart';

class AuthRemoteDataSource extends DataSource {
  final ApiClient client;

  AuthRemoteDataSource(this.client);

  Future<SingleMResponse<User, UserMeta?>> login(
    String mobile,
    String password,
  ) async {
    Map<String, dynamic> data = <String, dynamic>{
      "mobile": "+966${mobile.cleanMobile()}",
      "password": password,
      "device_id": await deviceIdInfo(),
      "device_type": getDeviceType(),
      'device_token': 'test_token',
    };

    return mapSingleMResponse<User, UserMeta?>(await client.post(
      Api.login(),
      body: data,
      headers: Api.headers(),
    ));
  }

  Future<SingleMResponse<User, UserMeta?>> register(
    String mobile,
    String name,
    String password,
    String referralCode,
  ) async {
    Map<String, dynamic> data = <String, dynamic>{
      "name": name,
      "mobile": "+966${mobile.cleanMobile()}",
      "password": password,
      "referral_code": referralCode,
      "device_id": await deviceIdInfo(),
      "device_type": getDeviceType(),
      'device_token': 'test_token',
    };

    return mapSingleMResponse<User, UserMeta?>(await client.post(
      Api.register(),
      body: data,
      headers: Api.headers(),
    ));
  }

  Future<SingleMResponse<User, UserMeta?>> completeRegistration(
      CompleteRegistration completeRegistrationData) async {
    return mapSingleMResponse<User, UserMeta?>(await client.put(
      Api.completeRegistration(),
      body: completeRegistrationData.body,
      headers: Api.headers(),
    ));
  }

  Future<SingleMResponse<User, UserMeta?>> activation(
    String mobile,
    String code,
  ) async {
    Map<String, String> data = <String, String>{
      "code": code.englishNumbers(),
      "mobile": "+966${mobile.cleanMobile()}",
      "device_id": await deviceIdInfo(),
      "device_type": getDeviceType(),
      'device_token': 'test_token',
    };

    return mapSingleMResponse<User, UserMeta?>(await client.post(
      Api.verify(),
      body: data,
      headers: Api.headers(),
    ));
  }

  Future<SuccessResponse> resend(String mobile) async {
    return mapSuccessResponse(await client.post(
      Api.resend(),
      body: {
        "mobile": "+966${mobile.cleanMobile()}",
      },
      headers: Api.headers(),
    ));
  }

  Future<SuccessResponse> forget(String mobile) async {
    return mapSuccessResponse(await client.post(
      Api.forgetPassword(),
      body: {
        "mobile": "+966${mobile.cleanMobile()}",
      },
      headers: Api.headers(),
    ));
  }

  Future<SuccessResponse> resetPassword(
    String mobile,
    String newPassword,
    String confirmPassword,
    String code,
  ) async {
    return mapSuccessResponse(await client.put(
      Api.resetPassword(),
      body: {
        "new_password": newPassword,
        "c_password": confirmPassword,
      },
      headers: Api.headers(),
    ));
  }

  Future<SuccessResponse> logout(logoutFromOther) async {
    return mapSuccessResponse(await client.post(
      Api.logout(),
      body: {
        "all": logoutFromOther.toString(),
      },
      headers: Api.headers(),
    ));
  }

  Future<SuccessResponse> changePassword(
    String currentPassword,
    String newPassword,
    String confirmPassword,
  ) async {
    return mapSuccessResponse(await client.put(
      Api.changPassword(),
      body: {
        "current_password": currentPassword,
        "new_password": newPassword,
        "c_password": confirmPassword,
      },
      headers: Api.headers(),
    ));
  }

  Future<Map<String, dynamic>> ldProfile() async {
    final Response response = await client.get(
      Api.ldProfile(),
      headers: Api.headers(),
    );
    return response.data;
  }

  Future<SingleResponse<User>> editProfile(
    User profile,
  ) async {
    return mapSingleResponse<User>(await client.put(
      Api.profile(),
      body: jsonEncode(profile),
      headers: Api.headers(),
    ));
  }

  Future<SingleMResponse<User, ProfileMeta?>> profile() async {
    return mapSingleMResponse<User, ProfileMeta?>(await client.get(
      Api.profile(),
      headers: Api.headers(),
    ));
  }

  Future<SuccessResponse> delete(String reason) async {
    return mapSuccessResponse(await client.post(
      Api.delete(),
      body: {
        "reason": reason,
      },
      headers: Api.headers(),
    ));
  }

  Future<ListResponse<Country>> countries() async {
    return mapListResponse<Country>(await client.get(
      Api.countries(),
      headers: Api.headers(),
    ));
  }

  Future<SingleResponse<User>> clientInfo(int id) async {
    return mapSingleResponse<User>(await client.get(
      Api.clientInfo(id),
      headers: Api.headers(),
    ));
  }

  Future<SuccessResponse> updateToken() async {
    Map<String, String> header = <String, String>{
      "device_id": await deviceIdInfo(),
      "device_type": getDeviceType(),
    };

    if (header["device_token"] == "NotFoundFCM" ||
        header["fcm_device_token"] == "NotFoundFCM") {
      return Future.error('error update token');
    }

    return mapSuccessResponse(await client.put(
      Api.updateToken(),
      headers: Api.headers(extra: header),
      body: header,
    ));
  }

  Future<SingleMResponse<User, UserMeta?>> loginWithSocial(
    SocialAccountUser user,
  ) async {
    Map<String, dynamic> data = <String, dynamic>{
      "email": user.email,
      "provider": user.provider,
      "provider_id": user.providerId,
      "token": user.token,
      "device_id": await deviceIdInfo(),
      "device_type": getDeviceType(),
    };

    return mapSingleMResponse<User, UserMeta?>(await client.post(
      Api.loginWithSocial(),
      body: data,
      headers: Api.headers(),
    ));
  }

  Future<SingleMResponse<User, UserMeta?>> refreshToken() async {
    return mapSingleMResponse<User, UserMeta?>(await client.post(
      Api.refreshToken(),
      headers: Api.headers(),
    ));
  }
}
