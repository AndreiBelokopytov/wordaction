import 'package:flutter/foundation.dart';
import 'package:wordaction/infrastructure/api/wp/models/media_size.dart';

@immutable
class MediaDetails {
  final int width;
  final int height;
  final String file;
  final Map<String, MediaSize> sizes;

  String get mediumSize => sizes['medium'].sourceUrl;

  MediaDetails.fromJSON(rawData)
      : width = rawData['width'],
        height = rawData['height'],
        file = rawData['file'],
        sizes = (rawData['sizes'] as Map<String, dynamic>).map(
            (size, rawSizeData) =>
                MapEntry(size, MediaSize.fromJSON(rawSizeData)));
}
