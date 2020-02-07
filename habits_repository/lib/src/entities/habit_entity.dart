import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class HabitEntity extends Equatable {
  final String id;
  final String title;
  final String description;
  final List<String> days;
  final int icon;

  HabitEntity({ this.id, this.title, this.description, this.days, this.icon });

  Map<String, Object> toJson() {
    return {
      'title': title,
      'description': description,
      'days': days,
      'icon': icon,
      'id': id,
    };
  }

  static HabitEntity fromJson(Map<String, Object> json) {
    return HabitEntity(
      title: json['title'] as String,
      description: json['description'] as String,
      days: json['days'] as List<String>,
      icon: json['icon'] as int,
      id: json['id'] as String,
    );
  }

  @override
  String toString() {
    return 'HabitEntity { title: $title, description: $description, days: $days, icon: $icon, id: $id }';
  }

  static HabitEntity fromSnapshot(DocumentSnapshot snap) {
    return HabitEntity(
      title: snap.data['title'] ?? "",
      description: snap.data['description'] ?? "",
      days: List.from(snap.data['days']),
      icon: snap.data['icon'] ?? 0,
      id: snap.documentID,
    );
  }

  Map<String, Object> toDocument() {
    return {
      'title': title,
      'description': description,
      'days': days,
      'icon': icon,
    };
  }

  @override
  List<Object> get props => [id];
}