// @dart=2.9

class Task {
  dynamic id;
  String name;
  String customIdentifier;
  String description;
  String active = 'Y';
  // DateTime createdAt = DateTime.now();
  // DateTime updatedAt = DateTime.now();
  int projectId;

  Task({
    this.id,
    this.name,
    this.customIdentifier,
    this.description,
    this.projectId,
  });
}
