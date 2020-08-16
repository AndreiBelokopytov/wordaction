import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:wordaction/domain/model/post.dart';

class PostListItem extends StatelessWidget {
  final Post post;

  PostListItem({@required this.post});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Card(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          CachedNetworkImage(
              imageUrl: post.featuredMedia, fit: BoxFit.cover, height: 220),
          ListTile(
              leading: Padding(
                padding: EdgeInsets.only(right: 8),
                child: CachedNetworkImage(
                  imageUrl: post.politician.avatar48,
                  width: 48,
                  height: 48,
                ),
              ),
              contentPadding: EdgeInsets.all(8.0),
              title: Text(post.title, style: Theme.of(context).textTheme.title),
              subtitle: Padding(
                padding: EdgeInsets.symmetric(vertical: 12),
                child: Text(
                    "Опубликовано в: ${post.catetories.map((category) => category.name).join(',')}"),
              ))
        ],
      )),
    );
  }
}
