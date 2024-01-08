class AllArticlesEntity {
  final List<ArticlesEntity> result;

  AllArticlesEntity({required this.result});
}

class ArticlesEntity {
  final int id;
  final String title;
  final String content;
  final bool isActive;
  final int timeToRead;
  final String articleCover;
  final Category? category;

  ArticlesEntity(
      {required this.id,
      required this.title,
      required this.content,
      required this.isActive,
      required this.timeToRead,
      required this.articleCover,
      this.category});
}

class Category {
  final String name;

  Category({required this.name});
}
