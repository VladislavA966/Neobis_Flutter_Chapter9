part of 'concrete_quize_bloc.dart';

@immutable
sealed class ConcreteQuizeState {}

final class ConcreteQuizeInitial extends ConcreteQuizeState {}

final class ConcreteQuizeLoading extends ConcreteQuizeState {}

final class ConcreteQuizeLoaded extends ConcreteQuizeState {
  final ConcreteQuizesList model;

  ConcreteQuizeLoaded({required this.model});
}

final class ConcreteQuizeError extends ConcreteQuizeState {
  final String errorText;

  ConcreteQuizeError({required this.errorText});
}
