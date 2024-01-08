part of 'articles_bloc.dart';

@immutable
sealed class ArticlesState {}

final class ArticlesInitial extends ArticlesState {}

final class ArticlesLoading extends ArticlesState {}

final class ArticlesLoaded extends ArticlesState {
  final AllArticlesEntity model;

  ArticlesLoaded({required this.model});
}



final class ArticlesError extends ArticlesState {
  final String errorText;

  ArticlesError({required this.errorText});
}
