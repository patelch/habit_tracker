import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habit_tracker/bloc/habits_bloc/habits.dart';
import 'package:habit_tracker/views/components/habit_card.dart';
import 'package:habit_tracker/views/components/radial_progress.dart';
import 'package:habit_tracker/views/constants/colors.dart';
import 'package:habit_tracker/views/screens/add_habit_screen.dart';
import 'package:habits_repository/habits_repository.dart';
import 'package:line_icons/line_icons.dart';

class HabitsTab extends StatelessWidget {

  static const String id = "habits_tab";

  final HabitsRepository habitsRepository;

  HabitsTab({ this.habitsRepository });

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 7,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('HabiTask'),
          elevation: 0,
          backgroundColor: Colors.white,
          actions: <Widget>[
            IconButton(
              icon: Icon(
                LineIcons.plus,
                color: blueColor,
              ),
              onPressed: () {
                showModalBottomSheet(
                  backgroundColor: Colors.transparent,
                  context: context,
                  builder: (context) {
                    return AddHabitScreen();
                  },
                );
              },
            )
          ],
          bottom: TabBar(
            labelPadding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 10),
            tabs: createHeaderDays(),
            indicatorSize: TabBarIndicatorSize.label,
            onTap: (index) {
              // TODO: correct date
              BlocProvider.of<HabitsBloc>(context).add(LoadHabits(day: DateTime.now()));
            },
          ),
        ),
        body: BlocBuilder<HabitsBloc, HabitsState> (
          builder: (context, state) {
            List<Habit> habits;
            if (state is HabitsLoadedState) {
              habits = state.habits;
            } else {
              habits = [];
            }

            return TabBarView(
              children: createTabView(habits),
            );
          },
        ),
      ),
    );

  }

  List<Widget> createHeaderDays() {

    List<Tab> header = [];

    for (int i = 3; i < 3 + 7; i++) {
      header.add(
        Tab(
          child: RadialProgress(
            progressPercent: 0.4,
            day: '$i',
            isSelected: i == 3,
          ),
        )
      );
    }

    return header;
  }

  List<Widget> createTabView(List<Habit> habits) {

    List<Widget> tabViews = [];

    for (int i = 3; i < 3 + 7; i++) {
      tabViews.add(
        ListView.builder(
          itemCount: habits.length,

          padding: EdgeInsets.all(10),
          itemBuilder: (context, index) {
            return HabitCard(habit: habits[index]);
          },
        ),
      );
    }

    return tabViews;
  }
}
