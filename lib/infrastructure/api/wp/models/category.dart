import 'package:flutter/foundation.dart';

@immutable
class Category {
  final int id;
  final int count;
  final String description;
  final String link;
  final String name;
  final String taxonomy;
  final int parent;

  Category.fromJSON(dynamic rawData)
      : id = rawData['id'],
        count = rawData['count'],
        description = rawData['description'],
        link = rawData['link'],
        name = rawData['name'],
        taxonomy = rawData['taxonomy'],
        parent = rawData['parent'];
}
