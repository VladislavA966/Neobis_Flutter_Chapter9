part of 'articles_bloc.dart';

@immutable
sealed class ArticlesEvent {}

class GetAllArticlesEvent extends ArticlesEvent {
  final String? search;
  final List<int>? categories;

  GetAllArticlesEvent({this.search, this.categories});
}
