import 'package:placeholder/data/model/comment.dart';
import 'package:placeholder/data/network/api_service.dart';

class CommentRepository {
  final ApiService apiService;

  CommentRepository(this.apiService);

  Future<List<Comment>> getComments(String postId) async {
    try {
      return await apiService.getComments(postId);
    } catch (e) {
      throw Exception('something went wrong');
    }
  }
}
