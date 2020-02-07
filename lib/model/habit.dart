import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:habit_tracker/model/day.dart';

class Habit extends Equatable {

  final String title;
  final String description;
  final List<Day> days;
  final IconData icon;

  Habit({ this.title, this.description, this.days, this.icon });

  @override
  List<Object> get props => [title, description, days, icon];

}