import 'package:flutter/material.dart';
import 'package:habit_tracker/model/user.dart';
import 'package:habit_tracker/views/screens/tab_screen/calendar_tab.dart';
import 'package:habit_tracker/views/screens/tab_screen/community_tab.dart';
import 'package:habit_tracker/views/screens/tab_screen/group_tab.dart';
import 'package:habit_tracker/views/screens/tab_screen/habits_tab.dart';
import 'package:habit_tracker/views/screens/tab_screen/settings_tab.dart';
import 'package:line_icons/line_icons.dart';

class BottomNavigationBarController extends StatefulWidget {

  static const String id = "navigation_screen";

  final User _user;

  BottomNavigationBarController({ @required User user }) : _user = user;

  @override
  _BottomNavigationBarControllerState createState() => _BottomNavigationBarControllerState();
}

class _BottomNavigationBarControllerState extends State<BottomNavigationBarController> {

  int _selectedPage = 0;
  final List<Widget> _pages = [
    HabitsTab(),
    CalendarTab(),
    GroupTab(),
    CommunityTab(),
    SettingsTab(),
  ];

  List<Widget> appbarActions = [];

  Widget _bottomNavigationBar(int selectedIndex) {
    return BottomNavigationBar(
      showSelectedLabels: false,
      showUnselectedLabels: false,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Color(0xFF5FC3E4),
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
      currentIndex: _selectedPage,
      onTap: _navigationTapped,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages.elementAt(_selectedPage),
      bottomNavigationBar: _bottomNavigationBar(_selectedPage),
    );
  }

  void _navigationTapped(int page) {
    setState(() {
      _selectedPage = page;
    });
  }
}
