import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class LoginEvent extends Equatable {}

class EmailChanged extends LoginEvent {

  final String email;

  EmailChanged({ @required this.email });

  @override
  List<Object> get props => [email];

}

class PasswordChanged extends LoginEvent {

  final String password;

  PasswordChanged({ @required this.password });

  @override
  List<Object> get props => [password];

}

class LoginPressed extends LoginEvent {
  final String email;
  final String password;

  LoginPressed({@required this.email, @required this.password});

  @override
  List<Object> get props => [email, password];

}

// signup pressed