part of 'concrete_quize_bloc.dart';

@immutable
sealed class ConcreteQuizeEvent {}

class GetConcreteQuizeEvent extends ConcreteQuizeEvent {
  final int id;

  GetConcreteQuizeEvent({required this.id});
}
