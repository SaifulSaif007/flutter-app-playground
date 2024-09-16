import 'package:go_router/go_router.dart';
import 'package:placeholder/page/comment_page.dart';
import 'package:placeholder/page/post_page.dart';

part 'router_constant.dart';

final GoRouter router = GoRouter(debugLogDiagnostics: true, routes: [
  GoRoute(
      name: postPageRoute,
      path: '/',
      builder: (context, state) => const PostScreen()),
  GoRoute(
      name: commentPageRoute,
      path: '/comment',
      builder: (context, state) => const CommentScreen())
]);
