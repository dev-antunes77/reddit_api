// ignore_for_file: public_member_api_docs, sort_constructors_first

class PostItem {
  PostItem({
    this.id = '',
    required this.title,
    required this.author,
    required this.ups,
    required this.commentsQuantity,
    required this.createdAt,
    this.fromHive = false,
  });
  final String id;
  final String title;
  final String author;
  final int ups;
  final int commentsQuantity;
  final DateTime createdAt;
  final bool fromHive;

  PostItem copyWith({
    String? id,
    String? title,
    String? author,
    int? ups,
    int? commentsQuantity,
    DateTime? createdAt,
    bool? fromHive,
  }) {
    return PostItem(
      id: id ?? this.id,
      title: title ?? this.title,
      author: author ?? this.author,
      ups: ups ?? this.ups,
      commentsQuantity: commentsQuantity ?? this.commentsQuantity,
      createdAt: createdAt ?? this.createdAt,
      fromHive: fromHive ?? this.fromHive,
    );
  }
}
