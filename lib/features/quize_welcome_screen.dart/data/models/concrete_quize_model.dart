import 'package:neobis_flutter_chapter9/features/quize_welcome_screen.dart/domain/entities/concrete_quize_use_case.dart';

class ConcreteQuizeModel {
  int? id;
  String? title;
  String? quizCover;
  String? welcomePage;

  ConcreteQuizeModel({this.id, this.title, this.quizCover, this.welcomePage});

  ConcreteQuizeModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    quizCover = json['quiz_cover'];
    welcomePage = json['welcome_page'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['quiz_cover'] = quizCover;
    data['welcome_page'] = welcomePage;
    return data;
  }

  ConcreteQuizEntity toEntity() {
    return ConcreteQuizEntity(
      id: id ?? 0,
      title: title ?? '',
      quizCover: quizCover ?? '',
      welcomePage: welcomePage ?? '',
    );
  }
}

class ConcreteQuizeListModel {
  final List<ConcreteQuizeModel> results;

  ConcreteQuizeListModel({required this.results});

  factory ConcreteQuizeListModel.fromJson(List<dynamic> jsonList) {
    List<ConcreteQuizeModel> results = jsonList
        .map((jsonItem) => ConcreteQuizeModel.fromJson(jsonItem))
        .toList();
    return ConcreteQuizeListModel(results: results);
  }

  List<Map<String, dynamic>> toJson() {
    return results.map((model) => model.toJson()).toList();
  }
}
