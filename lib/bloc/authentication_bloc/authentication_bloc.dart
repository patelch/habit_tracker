import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habit_tracker/bloc/authentication_bloc/authentication_event.dart';
import 'package:habit_tracker/bloc/authentication_bloc/authentication_state.dart';
import 'package:habit_tracker/data/user_repository.dart';
import 'package:meta/meta.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {

  final UserRepository _userRepository;

  AuthenticationBloc({ @required UserRepository userRepository })
    : assert(userRepository != null),
        _userRepository = userRepository;

  @override
  AuthenticationState get initialState => Unauthenticated();

  @override
  Stream<AuthenticationState> mapEventToState(AuthenticationEvent event) async* {
    if (event is AppStarted) {
      yield* _mapAppStartedToState();
    } else if (event is LoggedIn) {
      yield* _mapLoggedInToState();
    } else if (event is LoggedOut) {
      yield* _mapLoggedOutToState();
    }
  }

  Stream<AuthenticationState> _mapAppStartedToState() async* {

    bool isUserLoggedIn = await _userRepository.isSignedIn();

    if (isUserLoggedIn) {
      final user = await _userRepository.getUser();
      yield Authenticated(user: user);
    } else {
      yield Unauthenticated();
    }
  }

  Stream<AuthenticationState> _mapLoggedInToState() async* {
    final user = await _userRepository.getUser();
    yield Authenticated(user: user);
  }

  Stream<AuthenticationState> _mapLoggedOutToState() async* {
    await _userRepository.signOut();
    yield Unauthenticated();
  }

}