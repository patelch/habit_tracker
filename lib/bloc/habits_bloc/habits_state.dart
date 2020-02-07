import 'package:equatable/equatable.dart';
import 'package:habits_repository/habits_repository.dart';

abstract class HabitsState extends Equatable { }

class HabitsLoadedState extends HabitsState {
  final List<Habit> habits;

  HabitsLoadedState({ this.habits });

  @override
  List<Object> get props => [habits];

  @override
  String toString() => 'HabitsLoaded { habits: $habits }';
}

class HabitsNotLoadedState extends HabitsState {

  @override
  List<Object> get props => [];

}