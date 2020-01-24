import 'package:flutter_test/flutter_test.dart';
import 'package:habit_tracker/bloc/authentication_bloc/authentication.dart';
import 'package:habit_tracker/data/user_repository.dart';
import 'package:habit_tracker/model/user.dart';
import 'package:mockito/mockito.dart';

class MockUserRepository extends Mock implements UserRepository {}

void main() {
  AuthenticationBloc _authenticationBloc;
  MockUserRepository _userRepository;

  setUp(() {
    _userRepository = MockUserRepository();
    _authenticationBloc = AuthenticationBloc(userRepository: _userRepository);
  });

  tearDown(() {
    _authenticationBloc?.close();
  });

  test('initial state is correct', () {
    expect(_authenticationBloc.initialState, Unauthenticated());
  });

  test('close does not emit new states', () {
    expectLater(
      _authenticationBloc,
      emitsInOrder([Unauthenticated(), emitsDone]),
    );
    _authenticationBloc.close();
  });

  group('AppStarted', () {
    test('emits [Unauthenticated] for is not signed in', () {
      final expectedResponse = [
        Unauthenticated(),
      ];

      when(_userRepository.isSignedIn()).thenAnswer((_) => Future.value(false));

      expectLater(
        _authenticationBloc,
        emitsInOrder(expectedResponse),
      );

      _authenticationBloc.add(AppStarted());
    });

    test('emits [Unauthenticated, Authenticated] for is signed in', () {
      User mockUser = User(
        name: 'Chris Lake',
      );

      when(_userRepository.isSignedIn()).thenAnswer((_) => Future.value(true));
      when(_userRepository.getUser()).thenAnswer((_) => Future.value(mockUser));

      final expectedResponse = [
        Unauthenticated(),
        Authenticated(user: mockUser),
      ];

      expectLater(
        _authenticationBloc,
        emitsInOrder(expectedResponse),
      );

      _authenticationBloc.add(AppStarted());
    });

  });

  group('LoggedIn', () {
    test('emits [Unauthenticated, Authenticated] for is logged in', () {
      User mockUser = User(
        name: 'Chris Lake',
      );

      final expectedResponse = [
        Unauthenticated(),
        Authenticated(user: mockUser),
      ];

      when(_userRepository.getUser()).thenAnswer((_) => Future.value(mockUser));

      expectLater(
        _authenticationBloc,
        emitsInOrder(expectedResponse),
      );

      _authenticationBloc.add(LoggedIn());
    });

  });

  group('LoggedOut', () {
    test('emits [Unauthenticated] for is logged out', () {
      final expectedResponse = [
        Unauthenticated(),
      ];

      expectLater(
        _authenticationBloc,
        emitsInOrder(expectedResponse),
      );

      _authenticationBloc.add(LoggedOut());
    });

  });

  group('Multiple Event', () {
    test('emits [Unauthenticated, Authenticated, Unauthenticated] for LoggedIn then LoggedOut', () {
      User mockUser = User(
        name: 'Chris Lake',
      );

      final expectedResponse = [
        Unauthenticated(),
        Authenticated(user: mockUser),
        Unauthenticated(),
      ];

      when(_userRepository.getUser()).thenAnswer((_) => Future.value(mockUser));

      expectLater(
        _authenticationBloc,
        emitsInOrder(expectedResponse),
      );

      _authenticationBloc.add(LoggedIn());
      _authenticationBloc.add(LoggedOut());
    });

  });
}