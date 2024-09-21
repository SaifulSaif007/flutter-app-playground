import 'package:placeholder/data/model/post.dart';
import 'package:placeholder/data/network/api_service.dart';

class PostRepository {
  final ApiService _apiService;

  PostRepository(this._apiService);

  Future<List<Post>> getPosts() async {
    try {
      return await _apiService.getPosts();
    } catch (error) {
      throw Exception('Something went wrong');
    }
  }

}
