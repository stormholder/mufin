class Category {
  int? id;
  String? name;
  int? color;
  String? icon; //TODO
  String? comment;

  Category({
    this.id,
    this.name,
    this.color,
    this.icon,
    this.comment
  });

  factory Category.fromMap(Map<String, dynamic> json) => Category(
      id: json["id"],
      name: json["goal"],
      color: json["sumInitial"],
      icon: json["sumTarget"],
      comment: json["since"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "name": name,
    "color": color,
    "icon": icon,
    "comment": comment,
  };
}