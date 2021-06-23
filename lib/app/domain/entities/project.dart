class Project {
  int id;
  String name;
  String description;
  String cloneLink;
  String active;
  DateTime createdAt;
  DateTime updatedAt;

  Project({
    required this.id,
    required this.name,
    required this.description,
    required this.cloneLink,
    required this.active,
    required this.createdAt,
    required this.updatedAt,
  });
}
