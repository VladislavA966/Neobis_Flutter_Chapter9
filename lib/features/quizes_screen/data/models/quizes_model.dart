import 'package:neobis_flutter_chapter9/features/articles_screen/domain/entity/all_articles_entity.dart';
import 'package:neobis_flutter_chapter9/features/quizes_screen/domain/entity/quizes_entity.dart';

class QuizesModel {
  int? count;
  String? next;
  String? previous;
  List<ResultsQuiz>? results;

  QuizesModel({this.count, this.next, this.previous, this.results});

  QuizesModel.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    next = json['next'];
    previous = json['previous'];
    if (json['results'] != null) {
      results = <ResultsQuiz>[];
      json['results'].forEach((v) {
        results!.add(ResultsQuiz.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['count'] = count;
    data['next'] = next;
    data['previous'] = previous;
    if (results != null) {
      data['results'] = results!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  QuizesEntity toEntity() {
    List<ResultsQuizeEntity> resultsEntities = results != null
        ? results!.map((result) => result.toEntity()).toList()
        : [];
    return QuizesEntity(
        count: count ?? 0,
        next: next ?? '',
        previous: previous ?? '',
        results: resultsEntities);
  }
}

class ResultsQuiz {
  int? id;
  String? title;
  String? quizCover;
  int? totalQuestions;
  Category? category;

  ResultsQuiz(
      {this.id,
      this.title,
      this.quizCover,
      this.totalQuestions,
      this.category});

  ResultsQuiz.fromJson(Map<String, dynamic> json) {
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

  ResultsQuizeEntity toEntity() {
    return ResultsQuizeEntity(
        id: id ?? 0,
        title: title ?? '',
        quizCover: quizCover ?? '',
        totalQuestions: totalQuestions ?? 0);
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
