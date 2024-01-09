import 'package:neobis_flutter_chapter9/features/quize_screen/domain/entity/user_quize_entity.dart';

class UserQuizeModelList {
  List<UserQuizeModel>? modelsList;

  UserQuizeModelList({this.modelsList});

  factory UserQuizeModelList.fromJson(List<dynamic> parsedJson) {
    List<UserQuizeModel> models =
        parsedJson.map((i) => UserQuizeModel.fromJson(i)).toList();
    return UserQuizeModelList(modelsList: models);
  }

  List<Map<String, dynamic>> toJson() {
    return modelsList!.map((model) => model.toJson()).toList();
  }

  UserQuizEntityList toEntity() {
    return UserQuizEntityList(
        entityList: modelsList!.map((model) => model.toEntity()).toList());
  }
}

class UserQuizeModel {
  Quiz? quiz;
  String? title;
  List<Answer>? answer;

  UserQuizeModel({this.quiz, this.title, this.answer});

  UserQuizeModel.fromJson(Map<String, dynamic> json) {
    quiz = json['quiz'] != null ? Quiz.fromJson(json['quiz']) : null;
    title = json['title'];
    if (json['answer'] != null) {
      answer = <Answer>[];
      json['answer'].forEach((v) {
        answer!.add(Answer.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (quiz != null) {
      data['quiz'] = quiz!.toJson();
    }
    data['title'] = title;
    if (answer != null) {
      data['answer'] = answer!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  UserQuizeEntity toEntity() {
    return UserQuizeEntity(
      quiz: quiz?.toEntity(),
      title: title ?? '',
      answer: answer?.map((a) => a.toEntity()).toList(),
    );
  }
}

class Quiz {
  int? id;
  String? title;
  String? quizCover;
  int? totalQuestions;
  Category? category;

  Quiz(
      {this.id,
      this.title,
      this.quizCover,
      this.totalQuestions,
      this.category});

  Quiz.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    quizCover = json['quiz_cover'];
    totalQuestions = json['total_questions'];
    category =
        json['category'] != null ? Category.fromJson(json['category']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['quiz_cover'] = quizCover;
    data['total_questions'] = totalQuestions;
    if (category != null) {
      data['category'] = category!.toJson();
    }
    return data;
  }

  QuizEntity toEntity() {
    return QuizEntity(
      id: id,
      title: title,
      quizCover: quizCover,
      totalQuestions: totalQuestions,
      category: category?.toEntity(),
    );
  }
}

class Category {
  String? name;

  Category({this.name});

  Category.fromJson(Map<String, dynamic> json) {
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    return data;
  }

  CategoryEntity toEntity() {
    return CategoryEntity(name: name ?? '');
  }
}

class Answer {
  int? id;
  String? answerText;
  bool? isRight;

  Answer({this.id, this.answerText, this.isRight});

  Answer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    answerText = json['answer_text'];
    isRight = json['is_right'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['answer_text'] = answerText;
    data['is_right'] = isRight;
    return data;
  }

  AnswerEntity toEntity() {
    return AnswerEntity(
      id: id ?? 0,
      answerText: answerText ?? '',
      isRight: isRight ?? false,
    );
  }
}
