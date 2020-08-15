import 'package:flutter/material.dart';
import 'package:wordaction/application/model/pagination.dart';
import 'package:wordaction/domain/model/category.dart';
import 'package:wordaction/domain/model/post.dart';
import 'package:wordaction/infrastructure/api/wp/api/category_api.dart';
import 'package:wordaction/infrastructure/api/wp/api/media_api.dart';
import 'package:wordaction/infrastructure/api/wp/api/post_api.dart';
import 'package:wordaction/infrastructure/api/wp/models/category.dart' as wp_category;
import 'package:wordaction/infrastructure/repositories/post_repository_base.dart';

class PostRepositoryWP extends PostRepositoryBase {
  final PostApi _postApi;
  final CategoryApi _categoryApi;
  final MediaApi _mediaApi;

  PostRepositoryWP(
      {@required PostApi postApi,
      @required CategoryApi categoryApi,
      @required MediaApi mediaApi})
      : _postApi = postApi,
        _categoryApi = categoryApi,
        _mediaApi = mediaApi;

  @override
  Future<List<Post>> getRecent(Pagination pagination) async {
    var posts = await _postApi.getRecent(pagination);
    var mediaLoader = posts.map((el) => _mediaApi.getById(el.featuredMedia));
    var media = await Future.wait(mediaLoader);
    var categoryIds = [];
    posts.forEach((el) => categoryIds = categoryIds + el.categories);
    var categoryLoader =
        categoryIds.toSet().toList().map((el) => _categoryApi.getById(el));
    var categories = Map.fromIterable(await Future.wait(categoryLoader),
        key: (category) => category.id, value: (category) => category);

    return posts
        .asMap()
        .map((index, post) => MapEntry(
            index,
            Post(
                id: post.id,
                title: post.title.rendered,
                content: post.content.rendered,
                featuredMedia: media[index].mediaDetails.mediumSize,
                catetories: post.categories.map((id) {
                  var category = categories[id] as wp_category.Category;
                  return Category(
                    id: category.id,
                    name: category.name
                  );
                }).toList())))
        .values
        .toList();
  }
}
