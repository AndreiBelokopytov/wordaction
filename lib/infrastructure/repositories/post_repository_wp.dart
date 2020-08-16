import 'package:flutter/material.dart';
import 'package:wordaction/application/model/pagination.dart';
import 'package:wordaction/domain/model/category.dart';
import 'package:wordaction/domain/model/politician.dart';
import 'package:wordaction/domain/model/post.dart';
import 'package:wordaction/infrastructure/api/wp/api/category_api.dart';
import 'package:wordaction/infrastructure/api/wp/api/media_api.dart';
import 'package:wordaction/infrastructure/api/wp/api/post_api.dart';
import 'package:wordaction/infrastructure/api/wp/api/user_api.dart';
import 'package:wordaction/infrastructure/api/wp/models/category.dart'
    as wp_category;
import 'package:wordaction/infrastructure/repositories/post_repository_base.dart';
import 'package:wordaction/utils/extensions/list.dart';

class PostRepositoryWP extends PostRepositoryBase {
  final PostApi _postApi;
  final CategoryApi _categoryApi;
  final MediaApi _mediaApi;
  final UserApi _userApi;

  PostRepositoryWP(
      {@required PostApi postApi,
      @required CategoryApi categoryApi,
      @required MediaApi mediaApi,
      @required UserApi userApi})
      : _postApi = postApi,
        _categoryApi = categoryApi,
        _mediaApi = mediaApi,
        _userApi = userApi;

  @override
  Future<List<Post>> getRecent(Pagination pagination) async {
    var posts = await _postApi.getRecent(pagination);
    var mediaLoader = posts.map((el) => _mediaApi.getById(el.featuredMedia));
    var media = await Future.wait(mediaLoader);
    var categoryIds = [];
    posts.forEach((el) => categoryIds = categoryIds + el.categories);
    var categoryLoader =
        categoryIds.distinct().map((el) => _categoryApi.getById(el));
    var categories = {
      for (var category in await Future.wait(categoryLoader))
        category.id: category
    };
    var userIds = [];
    posts.forEach((el) => userIds = userIds + [el.author]);
    var userLoader = userIds.distinct().map((el) => _userApi.getById(el));
    var users = {for (var user in await Future.wait(userLoader)) user.id: user};

    return posts
        .asMap()
        .map((index, post) {
          var user = users[post.author];
          return MapEntry(
              index,
              Post(
                  id: post.id,
                  title: post.title.rendered,
                  content: post.content.rendered,
                  featuredMedia: media[index].mediaDetails.mediumSize,
                  catetories: post.categories.map((id) {
                    var category = categories[id] as wp_category.Category;
                    return Category(id: category.id, name: category.name);
                  }).toList(),
                  politician: Politician(
                      id: user.id,
                      name: user.name,
                      avatarUrls: user.avatarUrls)));
        })
        .values
        .toList();
  }
}
