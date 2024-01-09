class UserQuizEntityList {
  final List<UserQuizeEntity> entityList;

  UserQuizEntityList({required this.entityList});
}

class UserQuizeEntity {
  final QuizEntity? quiz;
  final String title;
  final List<AnswerEntity>? answer;

  UserQuizeEntity({required this.quiz, required this.title, this.answer});
}

class QuizEntity {
  final int? id;
  final String? title;
  final String? quizCover;
  final int? totalQuestions;
  final CategoryEntity? category;

  QuizEntity(
      {this.id,
      this.title,
      this.quizCover,
      this.totalQuestions,
      this.category});
}

class CategoryEntity {
  final String name;

  CategoryEntity({required this.name});
}

class AnswerEntity {
  final int id;
  final String answerText;
  final bool isRight;

  AnswerEntity(
      {required this.id, required this.answerText, required this.isRight});
}
