import 'package:dio/dio.dart';
import 'package:placeholder/data/model/comment.dart';
import 'package:placeholder/data/model/post.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: "https://jsonplaceholder.typicode.com")
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @GET("/posts")
  Future<List<Post>> getPosts();
  
  @GET("/posts/{id}/comments")
  Future<List<Comment>> getComments(@Path('id') String id);
}