import 'package:flutter/cupertino.dart';
import 'package:wordaction/infrastructure/api/wp/models/rendered_content.dart';

@immutable
class Post {
  final String date;
  final int id;
  final String link;
  final RenderedContent title;
  final RenderedContent content;
  final int featuredMedia;

  Post.fromJSON(Map<String, dynamic> rawData)
      : date = rawData['date'],
        id = rawData['id'],
        link = rawData['link'],
        title = RenderedContent.fromJSON(rawData['title']),
        content = RenderedContent.fromJSON(rawData['content']),
        featuredMedia = rawData['featured_media'];
}
