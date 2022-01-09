import 'package:mufin/models/transaction/transaction.dart';

class TransactionList {
  final List<Transaction>? transactions;

  TransactionList({
    this.transactions,
  });

  factory TransactionList.fromJson(List<dynamic> json) {
    List<Transaction> transactions = <Transaction>[];
    transactions = json.map((transactions) => Transaction.fromMap(transactions)).toList();

    return TransactionList(transactions: transactions);
  }
}