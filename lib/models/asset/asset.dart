class Asset {
  int? id;
  String? name;
  double? cost;
  double? income;
  String? comment;

  Asset({
    this.id,
    this.name,
    this.cost,
    this.income,
    this.comment,
  });

  factory Asset.fromMap(Map<String, dynamic> json) => Asset(
    id: json["id"],
    name: json["name"],
    cost: json["cost"],
    income: json["income"],
    comment: json["comment"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "name": name,
    "cost": cost,
    "income": income,
    "comment": comment,
  };
}