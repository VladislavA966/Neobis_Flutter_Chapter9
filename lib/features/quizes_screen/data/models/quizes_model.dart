import 'package:neobis_flutter_chapter9/features/quizes_screen/domain/entity/quizes_entity.dart';

class QuizeModel {
  int? id;
  String? title;
  String? quizCover;
  int? totalQuestions;
  int? category;

  QuizeModel(
      {this.id,
      this.title,
      this.quizCover,
      this.totalQuestions,
      this.category});

  QuizeModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    quizCover = json['quiz_cover'];
    totalQuestions = json['total_questions'];
    category = json['category'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['quiz_cover'] = quizCover;
    data['total_questions'] = totalQuestions;
    data['category'] = category;
    return data;
  }

  QuizesEntity toEntity() {
    return QuizesEntity(
      id: id ?? 0,
      title: title ?? '',
      quizCover: quizCover ?? '',
      totalQuestions: totalQuestions ?? 0,
      category: category ?? 0,
    );
  }
}

class QuizesModel {
  final List<QuizeModel> quizes;

  QuizesModel({required this.quizes});
  factory QuizesModel.fromJson(List<dynamic> parsedJson) {
    List<QuizeModel> quizes =
        parsedJson.map((json) => QuizeModel.fromJson(json)).toList();
    return QuizesModel(quizes: quizes);
  }
  AllQuizesEntity toAllQuizesEntity() {
    return AllQuizesEntity(
      quizes: quizes.map((quize) => quize.toEntity()).toList(),
    );
  }
}
