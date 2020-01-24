import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habit_tracker/bloc/navigation_bar_bloc/navigation_bar.dart';
import 'package:habit_tracker/model/user.dart';
import 'package:habit_tracker/views/constants/colors.dart';
import 'package:habit_tracker/views/screens/tab_screen/calendar_tab.dart';
import 'package:habit_tracker/views/screens/tab_screen/community_tab.dart';
import 'package:habit_tracker/views/screens/tab_screen/group_tab.dart';
import 'package:habit_tracker/views/screens/tab_screen/habits_tab.dart';
import 'package:habit_tracker/views/screens/tab_screen/settings_tab.dart';
import 'package:line_icons/line_icons.dart';

class NavigationScreen extends StatelessWidget {

  static const String id = "navigation_screen";

  final User _user;

  final List<Widget> _pages = [
    HabitsTab(),
    CalendarTab(),
    GroupTab(),
    CommunityTab(),
    SettingsTab(),
  ];

  NavigationScreen({ @required User user }) : _user = user;

  final NavigationBarBloc _navigationBarBloc = NavigationBarBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<NavigationBarBloc, int>(
        bloc: _navigationBarBloc,
        builder: (BuildContext context, int state) {
          return _pages.elementAt(state);
        },
      ),
      bottomNavigationBar: BlocBuilder<NavigationBarBloc, int>(
        bloc: _navigationBarBloc,
        builder: (BuildContext context, int state) {
          return BottomNavigationBar(
            showSelectedLabels: false,
            showUnselectedLabels: false,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: blueColor,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(LineIcons.book),
                title: Text('Habits'),
              ),
              BottomNavigationBarItem(
                icon: Icon(LineIcons.calendar),
                title: Text('Calendar'),
              ),
              BottomNavigationBarItem(
                icon: Icon(LineIcons.users),
                title: Text('Group'),
              ),
              BottomNavigationBarItem(
                icon: Icon(LineIcons.connectdevelop),
                title: Text('Community'),
              ),
              BottomNavigationBarItem(
                icon: Icon(LineIcons.cog),
                title: Text('Settings'),
              ),
            ],
            currentIndex: state,
            onTap: (index) {
              _navigationBarBloc.add(NavigationTabTapped(index: index));
            },
          );
        },
      ),
    );
  }
}