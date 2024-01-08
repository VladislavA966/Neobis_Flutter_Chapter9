part of 'concrete_article_bloc.dart';

@immutable
sealed class ConcreteArticleEvent {}

class GetConcreteArticleEvent extends ConcreteArticleEvent {
  final int id;

  GetConcreteArticleEvent({required this.id});
}
