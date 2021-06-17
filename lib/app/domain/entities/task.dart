class Task {
  int id;
  String customIdentifier;
  String description;
  String active;
  late DateTime createdAt;
  late DateTime updatedAt;
  int projectId;

  Task({
    required this.id,
    this.customIdentifier = '',
    this.description = '',
    this.active = 'Y',
    required this.projectId,
  }) {
    this.createdAt = DateTime.now();
    this.updatedAt = DateTime.now();
  }
}
