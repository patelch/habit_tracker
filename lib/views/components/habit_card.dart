import 'package:flutter/material.dart';
import 'package:habit_tracker/views/constants/colors.dart';
import 'package:habit_tracker/views/constants/icons.dart';
import 'package:habit_tracker/views/constants/text_styles.dart';
import 'package:habits_repository/habits_repository.dart';
import 'package:line_icons/line_icons.dart';

class HabitCard extends StatelessWidget {
  final Habit habit;

  HabitCard({this.habit});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Row(
              children: <Widget>[
                Icon(
                  categoryIcons[habit.icon],
                  size: 30,
                  color: blueColor,
                ),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: Text(
                    habit.title,
                    style: habitCardTextStyle,
                  ),
                ),
                Text(
                  habit.description,
                  style: habitCardTextStyle,
                ),
              ],
            ),
          ),
          Container(
            height: 2,
            decoration: BoxDecoration(
              gradient: pinkToBlueGradient,
            ),
          ),
        ],
      ),
    );
  }
}
