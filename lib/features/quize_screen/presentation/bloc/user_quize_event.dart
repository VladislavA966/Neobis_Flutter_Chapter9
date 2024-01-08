part of 'user_quize_bloc.dart';

@immutable
sealed class UserQuizeEvent {}

class GetUserQuizeEvent extends UserQuizeEvent {
  final int id;

  GetUserQuizeEvent({required this.id});
}
