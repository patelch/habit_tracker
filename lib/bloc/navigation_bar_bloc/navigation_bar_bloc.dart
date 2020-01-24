import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habit_tracker/bloc/navigation_bar_bloc/navigation_bar_event.dart';

class NavigationBarBloc extends Bloc<NavigationBarEvent, int> {

  @override
  int get initialState => 0;

  @override
  Stream<int> mapEventToState(NavigationBarEvent event) async* {
    if (event is NavigationTabTapped) {
      yield event.index;
    } else {
      yield 0;
    }
  }
}