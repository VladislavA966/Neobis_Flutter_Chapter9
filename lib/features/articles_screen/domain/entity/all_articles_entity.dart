class AllArticlesEntity {
  final List<ArticlesEntity> result;

  AllArticlesEntity({required this.result});
}

class ArticlesEntity {
  final int id;
  final String title;
  final String content;
  final int timeToRead;
  final String dateCreated;
  final bool isActive;
  final int category;

  ArticlesEntity(
      {required this.id,
      required this.title,
      required this.content,
      required this.timeToRead,
      required this.dateCreated,
      required this.isActive,
      required this.category});
}
