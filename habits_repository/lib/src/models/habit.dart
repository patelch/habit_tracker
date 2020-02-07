import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../entities/habit_entity.dart';

@immutable
class Habit extends Equatable {
  final String id;
  final String title;
  final String description;
  final List<String> days;
  final int icon;
  final bool isCompleted;

  Habit({ this.id, this.title, this.description, this.days, this.icon, this.isCompleted });

  Habit copyWith({ id, title, description, days, icon, isCompleted }) {
    return Habit(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      days: days ?? this.days,
      icon: icon ?? this.icon,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }

  @override
  String toString() {
    return 'Habit { title: $title, description: $description, days: $days, icon: $icon, id: $id, isCompleted: $isCompleted }';
  }

  HabitEntity toEntity() {
    return HabitEntity(id: id, title: title, description: description, days: days, icon: icon);
  }

  static Habit fromEntity(HabitEntity entity) {
    return Habit(
      id: entity.id,
      title: entity.title,
      description: entity.description,
      icon: entity.icon,
      days: entity.days,
      isCompleted: false,
    );
  }

  @override
  List<Object> get props => [id];
}