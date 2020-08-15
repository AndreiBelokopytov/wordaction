import 'package:flutter/material.dart';
import 'package:wordaction/domain/model/post.dart';

class PostListItem extends StatelessWidget {
  final Post post;

  PostListItem({@required this.post});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          ListTile(
            title: Text(post.title),
          )
        ],
      )
    );
  }
}