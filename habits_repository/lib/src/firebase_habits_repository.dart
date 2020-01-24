import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';

import '../habits_repository.dart';
import 'entities/habit_entity.dart';

class FirebaseHabitsRepository implements HabitsRepository {
  final habitsCollection = Firestore.instance.collection('habits');

  @override
  Future<void> addNewHabit(Habit habit) {
    return habitsCollection.add(habit.toEntity().toDocument());
  }

  @override
  Future<void> deleteHabit(Habit habit) {
    return habitsCollection.document(habit.id).delete();
  }

  @override
  Stream<List<Habit>> habits() {
    return habitsCollection.snapshots().map((snapshot) {
      return snapshot.documents
          .map((document) => Habit.fromEntity(HabitEntity.fromSnapshot(document)))
          .toList();
    });
  }
}