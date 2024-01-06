import 'package:neobis_flutter_chapter9/features/articles_screen/domain/entity/all_articles_entity.dart';

class ArticlesModel {
  int? id;
  String? title;
  String? content;
  int? timeToRead;
  String? dateCreated;
  bool? isActive;
  int? category;

  ArticlesModel(
      {this.id,
      this.title,
      this.content,
      this.timeToRead,
      this.dateCreated,
      this.isActive,
      this.category});

  ArticlesModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    content = json['content'];
    timeToRead = json['time_to_read'];
    dateCreated = json['date_created'];
    isActive = json['is_active'];
    category = json['category'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['content'] = content;
    data['time_to_read'] = timeToRead;
    data['date_created'] = dateCreated;
    data['is_active'] = isActive;
    data['category'] = category;
    return data;
  }

  ArticlesEntity toEntity() {
    return ArticlesEntity(
      id: id ?? 0,
      title: title ?? '',
      content: content ?? '',
      timeToRead: timeToRead ?? 0,
      dateCreated: dateCreated ?? '',
      isActive: isActive ?? false,
      category: category ?? 0,
    );
  }
}

class ArticlesModelList {
  final List<ArticlesModel> articles;

  ArticlesModelList({required this.articles});

  factory ArticlesModelList.fromJson(List<dynamic> parsedJson) {
    List<ArticlesModel> articles =
        parsedJson.map((json) => ArticlesModel.fromJson(json)).toList();
    return ArticlesModelList(articles: articles);
  }

  List<Map<String, dynamic>> toJson() {
    return articles.map((article) => article.toJson()).toList();
  }

  AllArticlesEntity toAllArticlesEntity() {
    List<ArticlesEntity> articlesEntities =
        articles.map((articleModel) => articleModel.toEntity()).toList();
    return AllArticlesEntity(result: articlesEntities);
  }
}
