class UserQuizeEntity {
  final QuizEntity? quiz;
  final String? title;
  final List<AnswerEntity>? answer;

  UserQuizeEntity({this.quiz, this.title, this.answer});
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
  final String? name;

  CategoryEntity({this.name});
}

class AnswerEntity {
  final int? id;
  final String? answerText;
  final bool? isRight;

  AnswerEntity({this.id, this.answerText, this.isRight});
}
