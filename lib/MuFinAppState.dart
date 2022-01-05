import 'dart:core';

import 'package:flutter/material.dart';
import 'package:mufin/DTO/Transaction.dart';

class MuFinAppState extends ChangeNotifier {
  int _selectedIndex;
  Transaction? _selectedTransaction;

  MuFinAppState(): _selectedIndex = 0;

  int get selectedIndex => _selectedIndex;

  set selectedIndex(int value) {
    _selectedIndex = value;
    notifyListeners();
  }

  Transaction? get selectedTransaction => _selectedTransaction;

  set selectedTransaction(Transaction? value) {
    _selectedTransaction = value;
    notifyListeners();
  }

  final List<Transaction> transactions = [
    Transaction(DateTime.now(), 'Grocery', 12.35, '\$', ''),
    Transaction(DateTime.now(), 'Electronics', 33.16, '\$', ''),
    Transaction(DateTime.now(), 'Entertainment', 53.02, '\$', '')
  ];
}