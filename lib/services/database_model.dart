import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';

class DatabaseModel with ChangeNotifier {
  final FirebaseDatabase _firebaseDatabase = FirebaseDatabase.instance;

  DatabaseReference forPath(String path) {
    return _firebaseDatabase.ref(path);
  }
}

class UserPathBuilder {
  String path = "";

  UserPathBuilder._();

  UserPathBuilder.forUser(String userID) {
    path = userID;
  }

  UserPathBuilder toWorkouts() {
    path += "/workouts";
    return this;
  }

  UserPathBuilder toWorkout(String workoutName) {
    path += "/$workoutName";
    return this;
  }

  UserPathBuilder toExercises() {
    path += "/exercises";
    return this;
  }

  UserPathBuilder toExercise(String exerciseName) {
    path += "/$exerciseName";
    return this;
  }
}
