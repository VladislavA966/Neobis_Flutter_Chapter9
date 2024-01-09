part of 'concrete_article_bloc.dart';

@immutable
sealed class ConcreteArticleState {}

final class ConcreteArticleInitial extends ConcreteArticleState {}

final class ConcreteArticleLoading extends ConcreteArticleState {}

final class ConcreteArticleLoaded extends ConcreteArticleState {
  final ConcreteArticleEntity model;

  ConcreteArticleLoaded({required this.model});
}

final class ConcreteArticleError extends ConcreteArticleState {
  final String errorText;

  ConcreteArticleError({required this.errorText});
}
