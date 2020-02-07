import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habit_tracker/bloc/habits_bloc/habits_event.dart';
import 'package:habit_tracker/bloc/habits_bloc/habits_state.dart';
import 'package:habits_repository/habits_repository.dart';
import 'package:intl/intl.dart';
import 'package:meta/meta.dart';

class HabitsBloc extends Bloc<HabitsEvent, HabitsState> {

  final HabitsRepository _habitsRepository;
  List<DateTime> week = [];

  HabitsBloc({ @required HabitsRepository habitsRepository })
      : assert(habitsRepository != null),
        _habitsRepository = habitsRepository;

  @override
  HabitsState get initialState => HabitsNotLoadedState();

  @override
  Stream<HabitsState> mapEventToState(HabitsEvent event) async* {
    if (event is LoadHabits) {
      yield* _mapLoadHabitsToState(event);
    } else if (event is AddHabit) {
      yield* _mapAddHabitToState(event);
    } else if (event is DeleteHabit) {
      yield* _mapDeleteHabitToState(event);
    } else {
      yield HabitsNotLoadedState();
    }
  }

  Stream<HabitsState> _mapLoadHabitsToState(LoadHabits event) async* {
    List<Habit> habits = await _habitsRepository.habits(DateFormat('EEEE').format(event.day));
    yield HabitsLoadedState(habits: habits);
  }

  Stream<HabitsState> _mapAddHabitToState(AddHabit event) async* {
    await _habitsRepository.addNewHabit(event.habit);
    add(LoadHabits());
    yield HabitsNotLoadedState();
  }

  Stream<HabitsState> _mapDeleteHabitToState(DeleteHabit event) async* {
    await _habitsRepository.deleteHabit(event.habit);
    add(LoadHabits());
    yield HabitsNotLoadedState();
  }



}