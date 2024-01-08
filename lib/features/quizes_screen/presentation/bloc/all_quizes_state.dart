part of 'all_quizes_bloc.dart';

@immutable
sealed class AllQuizesState {}

final class AllQuizesInitial extends AllQuizesState {}

final class AllQuizesLoading extends AllQuizesState {}

final class AllQuizesLoaded extends AllQuizesState {
  final AllQuizesEntity model;

  AllQuizesLoaded({required this.model});
}

final class AllQuizesError extends AllQuizesState {
  final String errorText;

  AllQuizesError({required this.errorText});
}
