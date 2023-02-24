import 'package:bond/features/auth/data/models/user.dart';
import 'package:bond/features/auth/data/models/user_meta.dart';
import 'package:one_studio_core/core.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'auth_http_client.g.dart';

@RestApi(
    baseUrl:
        "https://omn55vf7dfz3e5g4o7pg6p6te40rfbat.lambda-url.us-east-1.on.aws/api/")
abstract class AuthHttpClient {
  factory AuthHttpClient(Dio dio, {String? baseUrl}) = _AuthHttpClient;

  @POST('/users/login')
  Future<SingleMResponse<User, UserMeta>> login(@Body() Map<String, dynamic> body);

  @POST('/users/register')
  Future<SingleMResponse<User, UserMeta>> register(@Body() Map<String, dynamic> body);
}
