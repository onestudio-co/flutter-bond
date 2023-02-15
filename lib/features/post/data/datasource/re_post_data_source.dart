import 'package:bond/features/post/data/models/post.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 're_post_data_source.g.dart';

@RestApi(
    baseUrl:
        "https://omn55vf7dfz3e5g4o7pg6p6te40rfbat.lambda-url.us-east-1.on.aws/api/")
abstract class PostClient {
  factory PostClient(Dio dio, {String? baseUrl}) = _PostClient;

  @GET("/posts")
  Future<List<Post>> getPosts();
}
