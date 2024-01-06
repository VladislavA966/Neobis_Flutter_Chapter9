part of 'articles_bloc.dart';

@immutable
sealed class ArticlesEvent {}

class GetAllArticlesEvent extends ArticlesEvent {}

class GetConcreteArticleEvent extends ArticlesEvent {
  final int id;

  GetConcreteArticleEvent({required this.id});
}
