import 'package:gov_scrapy/models/post.dart';

class PostsGroup {
  String get date => posts.last.date;
  final posts = <Post>[];

  void add(Post model) => posts.add(model);

  static List<PostsGroup> fromPostList(List<Post> posts) {
    final response = <PostsGroup>[];
    try {
      for (final post in posts) {
        final groupIndex = response.length == 0
            ? -1
            : response.indexWhere((group) => group.date == post.date);
        if (groupIndex >= 0) {
          response[groupIndex].add(post);
        } else {
          response.add(PostsGroup()..add(post));
        }
      }
    } catch (ex) {
      print("🔴$ex");
    }

    return response;
  }
}
