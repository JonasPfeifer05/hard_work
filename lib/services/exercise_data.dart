class ExerciseData {
  final String name;
  final List<SetHistory> sets;

  ExerciseData(this.name, this.sets);
}

class SetHistory {
  final List<SetData> history;

  SetHistory(this.history);

  Map<String, dynamic> toJson() {
    return {"history": history};
  }
}

class SetData {
  final double weight;
  final int reps;

  SetData(this.weight, this.reps);

  Map<String, dynamic> toJson() {
    return {
      "weight": weight,
      "reps": reps,
    };
  }
}
