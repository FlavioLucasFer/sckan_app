class Project {
  int id;
  String name;
  String description;
  String cloneLink;
  String active;
  late DateTime createAt;
  late DateTime updatedAt;

  Project({
    required this.id,
    required this.name,
    this.description = '',
    this.cloneLink = '',
    this.active = 'Y',
  }) {
    this.createAt = DateTime.now();
    this.updatedAt = DateTime.now();
  }
}
