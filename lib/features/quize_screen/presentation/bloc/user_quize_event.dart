part of 'user_quize_bloc.dart';

@immutable
sealed class UserQuizeEvent {}

class GetAllAnswersEvent extends UserQuizeEvent {
  final int id;

  GetAllAnswersEvent({required this.id});
}

class NextQuestionEvent extends UserQuizeEvent {}
