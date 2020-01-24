import 'package:flutter_test/flutter_test.dart';
import 'package:habit_tracker/bloc/navigation_bar_bloc/navigation_bar.dart';

void main() {
  NavigationBarBloc _navigationBarBloc;

  setUp(() {
    _navigationBarBloc = NavigationBarBloc();
  });

  tearDown(() {
    _navigationBarBloc?.close();
  });

  test('initial state is correct', () {
    expect(_navigationBarBloc.initialState, 0);
  });

  test('close does not emit new states', () {
    expectLater(
      _navigationBarBloc,
      emitsInOrder([0, emitsDone]),
    );
    _navigationBarBloc.close();
  });

  group('NavigationBarTapped', () {
    test('returns 0 if the first icon in the nav bar is tapped', () {
      final expectedResponse = [
        0,
      ];

      expectLater(
        _navigationBarBloc,
        emitsInOrder(expectedResponse),
      );

      _navigationBarBloc.add(NavigationTabTapped(index: 0));
    });

    test('returns 1 if the second icon in the nav bar is tapped', () {
      final expectedResponse = [
        0,
        1,
      ];

      expectLater(
        _navigationBarBloc,
        emitsInOrder(expectedResponse),
      );

      _navigationBarBloc.add(NavigationTabTapped(index: 1));
    });

    test('returns 2 if the third icon in the nav bar is tapped', () {
      final expectedResponse = [
        0,
        2,
      ];

      expectLater(
        _navigationBarBloc,
        emitsInOrder(expectedResponse),
      );

      _navigationBarBloc.add(NavigationTabTapped(index: 2));
    });

    test('returns 2 then 4 if the third then fifth icons in the nav bar is tapped', () {
      final expectedResponse = [
        0,
        2,
        4,
      ];

      expectLater(
        _navigationBarBloc,
        emitsInOrder(expectedResponse),
      );

      _navigationBarBloc.add(NavigationTabTapped(index: 2));
      _navigationBarBloc.add(NavigationTabTapped(index: 4));
    });
  });
}