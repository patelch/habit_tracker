import 'package:equatable/equatable.dart';
import 'package:habit_tracker/model/user.dart';

class AuthenticationState extends Equatable {

  @override
  List<Object> get props => null;

}

class Authenticated extends AuthenticationState {

  final User user;

  Authenticated({ this.user });

  @override
  String toString() => 'Authenticated ${user.name}';

  @override
  List<Object> get props => [user];

}

class Unauthenticated extends AuthenticationState {

  @override
  String toString() => 'Unauthenticated';

}