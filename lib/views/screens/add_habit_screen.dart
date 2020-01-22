import 'package:flutter/material.dart';
import 'package:habit_tracker/views/constants/colors.dart';
import 'package:line_icons/line_icons.dart';

class AddHabitScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    String task = "";

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
      ),
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                flex: 10,
                child: Text(
                  'Add Task',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: blueColor,
                    fontSize: 20,
                  ),
                ),
              ),
              Expanded(
                child: IconButton(
                  icon: Icon(
                    LineIcons.times,
                    color: blueColor,
                  ),
                  onPressed: () {

                  },
                ),
              ),
            ],
          ),
          TextField(
            onChanged: (value) {
              task = value;
            },
            decoration: InputDecoration(
              labelText: 'Habit',
              alignLabelWithHint: true,
            ),
            autofocus: true,
            textInputAction: TextInputAction.done,
          ),

//          SizedBox(
//            height: 5,
//          ),

          TextField(
            onChanged: (value) {
              task = value;
            },
            decoration: InputDecoration(
              labelText: 'Duration',
              alignLabelWithHint: true,
            ),
            textInputAction: TextInputAction.done,
          ),


          SizedBox(
            height: 20,
          ),

          Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Icon(
                    LineIcons.calendar,
                    size: 30,
                    color: Colors.grey.shade500,
                  ),

                  SizedBox(
                    width: 10,
                  ),

                  Expanded(
                    child: Text(
                      'Days',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey.shade700,
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(
                height: 5,
              ),

              ActivityDaysBar(),

              SizedBox(
                height: 20,
              ),

              Row(
                children: <Widget>[
                  Icon(
                    LineIcons.th_large,
                    size: 30,
                    color: Colors.grey.shade500,
                  ),

                  SizedBox(
                    width: 10,
                  ),

                  Expanded(
                    child: Text(
                      'Category',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey.shade700,
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(
                height: 5,
              ),

              ActivityCategoryBar(),
            ],
          ),


          SizedBox(
            height: 10,
          ),


          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              gradient: pinkToBlueGradient,
            ),
            child: FlatButton(
              padding: EdgeInsets.symmetric(vertical: 15),
              child: Text(
                'Add',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
              onPressed: () {

              },
            ),
          ),
        ],
      ),
    );
  }
}

class ActivityDaysBar extends StatefulWidget {
  @override
  _ActivityDaysBarState createState() => _ActivityDaysBarState();
}

class _ActivityDaysBarState extends State<ActivityDaysBar> {

  Set<int> _selectedDays = new Set();
  List<String> _allDays = [
    'S', 'M', 'T', 'W', 'T', 'F', 'S',
  ];


  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: categoryButtons(),
    );
  }

  List<Widget> categoryButtons() {
    List<Widget> icons = [];

    for (int i = 0; i < 7; i++) {
      icons.add(
          Expanded(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 3),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                ),
                color: _selectedDays.contains(i) ? Color(0xAA5FC3E4) : Colors.grey.shade200,
              ),
              child: FlatButton(
                child: Text(
                  _allDays[i],
                ),
                onPressed: () {
                  setState(() {
                    if (_selectedDays.contains(i)) {
                      _selectedDays.remove(i);
                    } else {
                      _selectedDays.add(i);
                    }
                  });
                },
              ),
            ),
          )
      );
    }

    return icons;
  }
}


class ActivityCategoryBar extends StatefulWidget {
  @override
  _ActivityCategoryBarState createState() => _ActivityCategoryBarState();
}

class _ActivityCategoryBarState extends State<ActivityCategoryBar> {

  int selectedIcon = -1;

  List<Icon> _categoryIcons = [
    Icon(LineIcons.bicycle),
    Icon(LineIcons.book),
    Icon(LineIcons.graduation_cap),
    Icon(LineIcons.heartbeat),
    Icon(LineIcons.smile_o)
  ];

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: categoryButtons(),
    );
  }

  List<Widget> categoryButtons() {
    List<Widget> icons = [];

    for (int i = 0; i < _categoryIcons.length; i++) {
      icons.add(
        Expanded(
          child: Container(
            margin: EdgeInsets.all(5),

            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(15),
              ),
              color: selectedIcon == i ? Color(0xAA5FC3E4) : Colors.grey.shade200,
            ),
            child: IconButton(
              icon: _categoryIcons[i],
              onPressed: () {
                setState(() {
                  if (selectedIcon == i) {
                    selectedIcon = -1;
                  } else {
                    selectedIcon = i;
                  }
                });
              },
            ),
          ),
        )
      );
    }

    return icons;
  }
}

