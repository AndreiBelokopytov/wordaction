import 'package:flutter/material.dart';
import 'package:wordaction/domain/model/category.dart';
import 'package:wordaction/domain/model/politician.dart';

@immutable
class Post {
  final int id;
  final String title;
  final String content;
  final String featuredMedia;
  final List<Category> catetories;
  final Politician politician;

  Post(
      {@required this.id,
      @required this.title,
      @required this.content,
      @required this.featuredMedia,
      @required this.catetories,
      @required this.politician});
}
