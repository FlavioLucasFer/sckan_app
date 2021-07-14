class Project {
  int id;
  String name;
  String description;
  String cloneLink;
  String active = 'Y';
  DateTime createdAt = DateTime.now();
  DateTime updatedAt = DateTime.now();

  Project({
    this.id = -1,
    this.name = '',
    this.description = '',
    this.cloneLink = '',
  });
}
