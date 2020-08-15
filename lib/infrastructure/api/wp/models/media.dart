import 'package:flutter/foundation.dart';
import 'package:wordaction/infrastructure/api/wp/models/media_details.dart';
import 'package:wordaction/infrastructure/api/wp/models/rendered_content.dart';

@immutable
class Media {
  final String date;
  final int id;
  final String link;
  final String type;
  final RenderedContent title;
  final int author;
  final MediaDetails mediaDetails;

  Media.fromJSON(dynamic rawData):
    date = rawData['date'],
    id = rawData['id'],
    link = rawData['link'],
    type = rawData['type'],
    title = RenderedContent.fromJSON(rawData['title']),
    author = rawData['author'],
    mediaDetails = MediaDetails.fromJSON(rawData['media_details']);
}