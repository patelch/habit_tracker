import 'package:flutter/material.dart';
import 'package:habit_tracker/views/components/radial_progress.dart';

//class WeekHeader extends StatelessWidget {
//
//  final int selectedDay;
//  final int startDay;
//
//  WeekHeader({ this.selectedDay, this.startDay });
//
//  @override
//  Widget build(BuildContext context) {
//    return Container(
//      height: 75,
//      color: Colors.white,
//      child: Row(
//        mainAxisAlignment: MainAxisAlignment.spaceBetween,
//        children: createHeaderDays(),
//      ),
//    );
//  }
//
//  List<Widget> createHeaderDays() {
//
//    List<Widget> header = [];
//
//    for (int i = startDay; i < startDay + 7; i++) {
//      header.add(
//        RadialProgress(
//          progressPercent: 0.4,
//          day: '$i',
//          isSelected: i == selectedDay,
//        )
//      );
//    }
//
//    return header;
//  }
//
//}

class WeekHeader extends StatelessWidget {

  final int selectedDay;
  final int startDay;

  WeekHeader({ this.selectedDay, this.startDay });

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 7,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            tabs: createHeaderDays(),
          ),
          title: Text('Tabs Demo'),
        ),
        body: TabBarView(
          children: [
            Icon(Icons.directions_car),
            Icon(Icons.directions_transit),
            Icon(Icons.directions_bike),
            Icon(Icons.directions_car),
            Icon(Icons.directions_transit),
            Icon(Icons.directions_bike),

          ],
        ),
      ),
    );
  }

  List<Widget> createHeaderDays() {

    List<Widget> header = [];

    for (int i = startDay; i < startDay + 7; i++) {
      header.add(
        Tab(
          child: RadialProgress(
            progressPercent: 0.4,
            day: '$i',
            isSelected: i == selectedDay,
          ),
        )
      );
    }

    return header;
  }
}

