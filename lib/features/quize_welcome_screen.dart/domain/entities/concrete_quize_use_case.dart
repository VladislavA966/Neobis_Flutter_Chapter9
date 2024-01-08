class ConcreteQuizEntity {
  final int id;
  final String title;
  final String quizCover;
  final String welcomePage;

  ConcreteQuizEntity(
      {required this.id,
      required this.title,
      required this.quizCover,
      required this.welcomePage});
}

class ConcreteQuizesList {
  final List<ConcreteQuizEntity> result;

  ConcreteQuizesList({required this.result});
}
