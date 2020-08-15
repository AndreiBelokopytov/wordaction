import 'package:flutter/foundation.dart';

@immutable
class Post {
  final int id;
  final String title;
  final String content;
  final String featuredMedia;

  Post({@required this.id, @required this.title, @required this.content, @required this.featuredMedia});
}