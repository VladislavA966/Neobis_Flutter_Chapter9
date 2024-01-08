import 'package:neobis_flutter_chapter9/features/articles_screen/domain/entity/all_articles_entity.dart';

class ArticlesModel {
  int? id;
  String? title;
  String? content;
  bool? isActive;
  int? timeToRead;
  String? articleCover;
  Category? category;

  ArticlesModel(
      {this.id,
      this.title,
      this.content,
      this.isActive,
      this.timeToRead,
      this.articleCover,
      this.category});

  ArticlesModel.fromJson(Map<String, dynamic> json) {
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

  ArticlesEntity toEntity() {
    return ArticlesEntity(
      id: id ?? 0,
      title: title ?? '',
      content: content ?? '',
      isActive: isActive ?? false,
      timeToRead: timeToRead ?? 0,
      articleCover: articleCover ?? '',
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
