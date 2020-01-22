import 'package:equatable/equatable.dart';

abstract class NavigationBarEvent extends Equatable {

}

class NavigationBarItemTapped extends NavigationBarEvent {

  final int index;

  NavigationBarItemTapped({ this.index });

  @override
  List<Object> get props => [index];

}