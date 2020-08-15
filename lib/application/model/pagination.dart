import 'package:flutter/foundation.dart';

@immutable
class Pagination {
  final int page;
  final int perPage;
  final offset;

  Pagination({this.page = 1, this.perPage = 20, this.offset = 0});
}
