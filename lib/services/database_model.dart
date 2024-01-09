import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';

class DatabaseModel with ChangeNotifier {
  final FirebaseDatabase _firebaseDatabase = FirebaseDatabase.instance;

  DatabaseReference forPath(String path) {
    return _firebaseDatabase.ref(path);
  }
}

class PathBuilder {
  String path = "";

  PathBuilder._();

  PathBuilder.forUser(String userID) {
    path = userID;
  }

  PathBuilder toWorkouts() {
    path += "/workouts";
    return this;
  }

  PathBuilder toWorkout(String workoutName) {
    path += "/$workoutName";
    return this;
  }

  PathBuilder toExercises() {
    path += "/exercises";
    return this;
  }

  PathBuilder toExercise(String exerciseName) {
    path += "/$exerciseName";
    return this;
  }
}
