import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

abstract class NavigationBarEvent extends Equatable { }

class NavigationTabTapped extends NavigationBarEvent {
  final int index;

  NavigationTabTapped({@required this.index});

  @override
  List<Object> get props => [index];

  @override
  String toString() => 'Tab index: $index';
}