import 'package:wordaction/application/model/pagination.dart';
import 'package:wordaction/domain/model/post.dart';

abstract class PostRepositoryBase {
  Future<List<Post>> getRecent(Pagination pagination);
}