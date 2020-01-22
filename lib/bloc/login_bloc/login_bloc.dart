import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habit_tracker/bloc/login_bloc/login_event.dart';
import 'package:habit_tracker/bloc/login_bloc/login_state.dart';
import 'package:habit_tracker/data/user_repository.dart';
import 'package:habit_tracker/utils/validators.dart';
import 'package:meta/meta.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {

  final UserRepository _userRepository;

  LoginBloc({ @required UserRepository userRepository })
      : assert(userRepository != null),
        _userRepository = userRepository;

  @override
  LoginState get initialState => LoginState.empty();

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is EmailChanged) {
      yield* _mapEmailChangedToState(event.email);
    } else if (event is PasswordChanged) {
      yield* _mapPasswordChangedToState(event.password);
    } else if (event is LoginPressed) {
      yield* _mapLoginPressedToState(
        email: event.email,
        password: event.password,
      );
    }
  }

  Stream<LoginState> _mapEmailChangedToState(String email) async* {
    yield state.update(
      isEmailValid: Validators.isValidEmail(email),
    );
  }

  Stream<LoginState> _mapPasswordChangedToState(String password) async* {
    yield state.update(
      isEmailValid: Validators.isValidPassword(password),
    );
  }

  Stream<LoginState> _mapLoginPressedToState({ String email, String password }) async* {
    try {
      await _userRepository.signIn(email: email, password: password);
      yield LoginState.success();
    } catch (_) {
      yield LoginState.failure();
    }
  }

}