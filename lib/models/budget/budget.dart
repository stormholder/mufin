class Budget {
  int? id;
  String? goal;
  double? sumInitial;
  double? sumTarget;
  DateTime? since;
  DateTime? until;
  double? percentAnnual;

  Budget({
    this.id,
    this.goal,
    this.sumInitial,
    this.sumTarget,
    this.since,
    this.until,
    this.percentAnnual
  });

  factory Budget.fromMap(Map<String, dynamic> json) => Budget(
    id: json["id"],
    goal: json["goal"],
    sumInitial: json["sumInitial"],
    sumTarget: json["sumTarget"],
    since: json["since"],
    until: json["until"],
    percentAnnual: json["percentAnnual"]
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "goal": goal,
    "sumInitial": sumInitial,
    "sumTarget": sumTarget,
    "since": since,
    "until": until,
    "percentAnnual": percentAnnual,
  };
}