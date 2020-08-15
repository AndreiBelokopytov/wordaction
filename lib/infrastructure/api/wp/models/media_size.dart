import 'package:flutter/foundation.dart';

@immutable
class MediaSize {
  final String file;
  final int width;
  final int height;
  final String mimeType;
  final String sourceUrl;

  MediaSize.fromJSON(rawData):
    file = rawData['file'],
    width = rawData['width'],
    height = rawData['height'],
    mimeType = rawData['mime_type'],
    sourceUrl = rawData['source_url'];
}