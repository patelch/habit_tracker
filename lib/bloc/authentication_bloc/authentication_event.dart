import 'package:equatable/equatable.dart';

class AuthenticationEvent extends Equatable {

  @override
  List<Object> get props => null;

}

class AppStarted extends AuthenticationEvent {

  @override
  String toString() => 'AppStarted';

}

class LoggedIn extends AuthenticationEvent {

  @override
  String toString() => 'Logged In';

}

class LoggedOut extends AuthenticationEvent {

  @override
  String toString() => 'Logged Out';

}