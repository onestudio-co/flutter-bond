import 'package:auto_route/annotations.dart';
import 'package:bond/features/post/data/models/post.dart';
import 'package:one_studio_core/core.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'post_client.g.dart';

@RestApi(
    baseUrl:
        "https://omn55vf7dfz3e5g4o7pg6p6te40rfbat.lambda-url.us-east-1.on.aws/api/")
abstract class PostClient {
  factory PostClient(Dio dio, {String? baseUrl}) = _PostClient;

  @GET("/posts?term=sky")
  Future<ListResponse<Post>> getPosts();


  @GET("/posts/random")
  Future<SingleResponse<Post>> random();

  @GET("posts")
  Future<SingleResponse<Post>> post(@QueryParam("id") String id);
}
