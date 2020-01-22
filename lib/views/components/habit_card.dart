import 'package:flutter/material.dart';
import 'package:habit_tracker/views/constants/colors.dart';
import 'package:line_icons/line_icons.dart';

class HabitCard extends StatefulWidget {
  @override
  _HabitCardState createState() => _HabitCardState();
}

class _HabitCardState extends State<HabitCard> {
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
                  LineIcons.bicycle,
                  size: 30,
                  color: blueColor,
                ),

                SizedBox(
                  width: 20,
                ),

                Expanded(
                  child: Text(
                    'Work out',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey.shade700,
                    ),
                  ),
                ),

                Text(
                  '30 min',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey.shade700,
                  ),
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
