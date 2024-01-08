class QuizesEntity {
  final int id;
  final String title;
  final String quizCover;
  final int totalQuestions;
  final int category;

  QuizesEntity(
      {required this.id,
      required this.title,
      required this.quizCover,
      required this.totalQuestions,
      required this.category});
}

class AllQuizesEntity {
  final List<QuizesEntity> quizes;

  AllQuizesEntity({required this.quizes});
}

