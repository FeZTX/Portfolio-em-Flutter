class Task {
  int? id;
  String? desc;
  bool check;

  Task({
    required this.id,
    required this.desc,
    this.check = false
  });

static List<Task> toDoList() {
  return [
  ];
}
}