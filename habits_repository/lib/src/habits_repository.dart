import 'dart:async';

import 'models/habit.dart';

abstract class HabitsRepository {

  Future<void> addNewHabit(Habit habit);

  Future<void> deleteHabit(Habit habit);

  Future<List<Habit>> habits(String day);

}