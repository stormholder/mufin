class Transaction {
  int? id;
  DateTime? timestamp;
  String? category;
  double? cost;
  String? currency;
  String? comment;

  Transaction({
    this.id,
    this.timestamp,
    this.category,
    this.cost,
    this.currency,
    this.comment
  });

  factory Transaction.fromMap(Map<String, dynamic> json) => Transaction(
    id: json["id"],
    timestamp: json["timestamp"],
    category: json["category"],
    cost: json["cost"],
    currency: json["currency"],
    comment: json["comment"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "timestamp": timestamp,
    "category": category,
    "cost": cost,
    "currency": currency,
    "comment": comment,
  };
}