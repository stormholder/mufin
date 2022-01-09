import 'package:flutter/material.dart';
import 'package:mufin/models/transaction/transaction.dart';

class TransactionsPage extends StatelessWidget {
  final List<Transaction> transactions;

  const TransactionsPage({
    Key? key,
    required this.transactions
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          for (var transaction in transactions)
            ListTile(
                title: Text(transaction.category!),
                subtitle: Text(transaction.currency! + " " + transaction.cost.toString())
            )
        ],
      ),
    );
  }
}