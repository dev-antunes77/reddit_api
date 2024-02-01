import 'package:api_mock/core/models/post_item.dart';

abstract interface class PostItemDatabase {
  Future<List<PostItem>> get();
  Future<void> create(PostItem post);
  Future<void> update(PostItem post);
  Future<void> delete(String id);
}
