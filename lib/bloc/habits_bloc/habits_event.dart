import 'package:equatable/equatable.dart';
import 'package:habits_repository/habits_repository.dart';

abstract class HabitsEvent extends Equatable { }

class LoadHabits extends HabitsEvent {

  final DateTime day;

  LoadHabits({ this.day });

  @override
  List<Object> get props => [day];

  @override
  String toString() => 'LoadHabits { day: $day }';

}

class AddHabit extends HabitsEvent {

  final Habit habit;

  AddHabit({ this.habit });

  @override
  List<Object> get props => [habit];

  @override
  String toString() => 'AddHabit { habit: $habit }';

}

class DeleteHabit extends HabitsEvent {

  final Habit habit;

  DeleteHabit({ this.habit });

  @override
  List<Object> get props => [habit];

  @override
  String toString() => 'DeleteHabit { habit: $habit }';

}