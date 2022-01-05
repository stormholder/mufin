class Transaction {
  final DateTime timestamp;
  final String category;
  final double cost;
  final String currency;
  final String comment;

  Transaction(
      this.timestamp,
      this.category,
      this.cost,
      this.currency, 
      this.comment
  );
}