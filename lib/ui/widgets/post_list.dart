import 'package:flutter/material.dart';
import 'package:wordaction/domain/model/post.dart';
import 'package:wordaction/ui/widgets/post_list_item.dart';

class PostList extends StatefulWidget {
  final List<Post> posts;
  final bool isLoading;

  PostList({@required this.posts, @required this.isLoading});

  @override
  State createState() {
    return _PostListState();
  }
}

class _PostListState extends State<PostList> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (_, index) => PostListItem(post: widget.posts[index]),
      separatorBuilder: (_, index) => const Divider(),
      itemCount: widget.posts.length,
    );
  }
}
