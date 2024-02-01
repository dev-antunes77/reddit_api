import 'package:api_mock/core/models/post_item.dart';
import 'package:hive/hive.dart';

part 'hive_post_item_model.g.dart';

@HiveType(typeId: 0)
final class PostItemHive extends PostItem with HiveObjectMixin {
  PostItemHive({
    super.id,
    required super.title,
    required super.author,
    required super.ups,
    required super.commentsQuantity,
    required super.createdAt,
    super.fromHive,
  });

  factory PostItemHive.fromPostItem(PostItem post) => PostItemHive(
        id: post.id,
        title: post.title,
        author: post.author,
        ups: post.ups,
        commentsQuantity: post.commentsQuantity,
        createdAt: post.createdAt,
        fromHive: post.fromHive,
      );
  @override
  @HiveField(0)
  String get id => super.id;

  @override
  @HiveField(1)
  String get title => super.title;

  @override
  @HiveField(2)
  String get author => super.author;

  @override
  @HiveField(3)
  int get ups => super.ups;

  @override
  @HiveField(4)
  int get commentsQuantity => super.commentsQuantity;

  @override
  @HiveField(5)
  DateTime get createdAt => super.createdAt;

  @override
  @HiveField(6)
  bool get fromHive => super.fromHive;
}
