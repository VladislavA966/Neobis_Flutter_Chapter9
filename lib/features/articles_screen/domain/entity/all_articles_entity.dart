class ArticlesEntity {
  int count;
  String next;
  String previous;
  List<ResultsEntity> results;

  ArticlesEntity(
      {required this.count,
      required this.next,
      required this.previous,
     required this.results});
}

class ResultsEntity {
  final int id;
  final String title;
  final String content;
  final bool isActive;
  final int timeToRead;
  final String articleCover;
  final CategoryEntity category;

  ResultsEntity(
      {required this.id,
      required this.title,
      required this.content,
      required this.isActive,
      required this.timeToRead,
      required this.articleCover,
      required this.category});
}

class CategoryEntity {
  final String name;

  CategoryEntity({required this.name});
}
