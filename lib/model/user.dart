import 'package:equatable/equatable.dart';

class User extends Equatable {

  final String name;
  final String email;
  final String photoUrl;

  User({ this.name, this.email, this.photoUrl });

  @override
  List<Object> get props => [name, email, photoUrl];

}