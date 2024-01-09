part of 'user_quize_bloc.dart';

@immutable
sealed class UserQuizeState {}

final class UserQuizeInitial extends UserQuizeState {}

final class UserQuizeLoaded extends UserQuizeState {
  final UserQuizEntityList model;

  UserQuizeLoaded({required this.model});
}

final class UserQuizeLoading extends UserQuizeState {}

final class UserQuizeError extends UserQuizeState {
  final String errorText;

  UserQuizeError({required this.errorText});
}
