import 'package:flutter_test/flutter_test.dart';
import 'package:habit_tracker/bloc/habits_bloc/habits.dart';
import 'package:habits_repository/habits_repository.dart';
import 'package:mockito/mockito.dart';

class MockHabitsRepository extends Mock implements HabitsRepository {}

void main() {
  HabitsBloc _habitsBloc;
  MockHabitsRepository _habitsRepository;

  setUp(() {
    _habitsRepository = MockHabitsRepository();
    _habitsBloc = HabitsBloc(habitsRepository: _habitsRepository);
  });

  tearDown(() {
    _habitsBloc?.close();
  });

  test('initial state is correct', () {
    expect(_habitsBloc.initialState, HabitsNotLoadedState());
  });

  test('close does not emit new states', () {
    expectLater(
      _habitsBloc,
      emitsInOrder([HabitsNotLoadedState(), emitsDone]),
    );
    _habitsBloc.close();
  });

  group('LoadHabits', () {
    test('emits [HabitsLoaded] with list of habits', () {
      Habit mockHabit = Habit(
        title: 'Read',
        description: '30 min',
        days: ['Monday, Tuesday, Wednesday'],
        icon: 2,
      );

      final expectedResponse = [
        HabitsNotLoadedState(),
        HabitsLoadedState(habits: [mockHabit]),
      ];

      when(_habitsRepository.habits('Monday')).thenAnswer((_) =>
          Future.value([mockHabit]));

      expectLater(
        _habitsBloc,
        emitsInOrder(expectedResponse),
      );

      _habitsBloc.add(LoadHabits(day: DateTime(2020, 2, 3)));
    });
  });
}