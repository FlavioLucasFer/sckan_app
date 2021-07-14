class Task {
  int id;
  String name;
  String customIdentifier;
  String description;
  String active = 'Y';
  DateTime createdAt = DateTime.now();
  DateTime updatedAt = DateTime.now();
  int projectId;

  Task({
    this.id = -1,
    this.name = '',
    this.customIdentifier = '',
    this.description = '',
    this.projectId = -1,
  });
}
