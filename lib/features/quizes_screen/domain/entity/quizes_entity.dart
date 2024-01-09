class QuizesEntity {
  final int count;
  final String next;
  final String previous;
  final List<ResultsQuizeEntity> results;

  QuizesEntity(
      {required this.count,
      required this.next,
      required this.previous,
      required this.results});
}

class ResultsQuizeEntity {
  final int id;
  final String title;
  final String quizCover;
  final int totalQuestions;
  final CategoryQuizeEntity? category;

  ResultsQuizeEntity(
      {required this.id,
      required this.title,
      required this.quizCover,
      required this.totalQuestions,
      this.category});
}

class CategoryQuizeEntity {
  final String name;

  CategoryQuizeEntity({required this.name});
}
