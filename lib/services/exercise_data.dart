class ExerciseData {
  final String name;
  final List<SetHistory> sets;

  ExerciseData(this.name, this.sets);
}

class SetHistory {
  final List<SetData> history;

  SetHistory(this.history);
}

class SetData {
  final double weight;
  final int reps;

  SetData(this.weight, this.reps);
}
