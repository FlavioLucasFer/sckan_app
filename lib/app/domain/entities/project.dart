// @dart=2.9

class Project {
  dynamic id;
  String name;
  String description;
  String cloneLink;
  String active = 'Y';
  // DateTime createdAt = DateTime.now();
  // DateTime updatedAt = DateTime.now();

  Project({
    this.id,
    this.name,
    this.description,
    this.cloneLink,
  });
}
