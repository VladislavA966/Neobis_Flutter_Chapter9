import 'package:neobis_flutter_chapter9/features/articles_screen/domain/entity/all_articles_entity.dart';

class ArticlesModel {
  int? count;
  String? next;
  String? previous;
  List<Results>? results;

  ArticlesModel({this.count, this.next, this.previous, this.results});

  ArticlesModel.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    next = json['next'];
    previous = json['previous'];
    if (json['results'] != null) {
      results = <Results>[];
      json['results'].forEach((v) {
        results!.add(Results.fromJson(v));
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

  ArticlesEntity toEntity() {
    List<ResultsEntity> resultsEntities = results != null
        ? results!.map((result) => result.toEntity()).toList()
        : [];

    return ArticlesEntity(
      count: count ?? 0,
      next: next ?? '',
      previous: previous ?? '',
      results: resultsEntities,
    );
  }
}

class Results {
  int? id;
  String? title;
  String? content;
  bool? isActive;
  int? timeToRead;
  String? articleCover;
  Category? category;

  Results(
      {this.id,
      this.title,
      this.content,
      this.isActive,
      this.timeToRead,
      this.articleCover,
      this.category});

  Results.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    content = json['content'];
    isActive = json['is_active'];
    timeToRead = json['time_to_read'];
    articleCover = json['article_cover'];
    category =
        json['category'] != null ? Category.fromJson(json['category']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['content'] = content;
    data['is_active'] = isActive;
    data['time_to_read'] = timeToRead;
    data['article_cover'] = articleCover;
    if (category != null) {
      data['category'] = category!.toJson();
    }
    return data;
  }

  ResultsEntity toEntity() {
    return ResultsEntity(
      id: id ?? 0,
      title: title ?? '',
      content: content ?? '',
      isActive: isActive ?? false,
      timeToRead: timeToRead ?? 0,
      articleCover: articleCover ?? '',
      category: category?.toEntity() ?? CategoryEntity(name: ''),
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
