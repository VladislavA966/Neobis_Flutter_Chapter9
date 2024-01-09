class ConcreteArticleModel {
  int? id;
  String? title;
  String? content;
  bool? isActive;
  int? timeToRead;
  String? articleCover;
  Category? category;

  ConcreteArticleModel(
      {this.id,
      this.title,
      this.content,
      this.isActive,
      this.timeToRead,
      this.articleCover,
      this.category});

  ConcreteArticleModel.fromJson(Map<String, dynamic> json) {
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
