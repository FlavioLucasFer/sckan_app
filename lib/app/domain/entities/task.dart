class Task {
  int id;
  String name;
  String customIdentifier;
  String description;
  String active;
  DateTime createdAt;
  DateTime updatedAt;
  int projectId;

  Task({
    required this.id,
    required this.name,
    required this.customIdentifier,
    required this.description,
    required this.active,
    required this.createdAt,
    required this.updatedAt,
    required this.projectId,
  });
}
