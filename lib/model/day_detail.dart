import 'package:equatable/equatable.dart';
import 'package:habit_tracker/model/day.dart';

import 'habit.dart';

class DayDetail extends Equatable {

  final DateTime date;
  final Day day;
  final List<Habit> habits;

  DayDetail({ this.date, this.day, this.habits });

  @override
  List<Object> get props => [date, day, habits];

}