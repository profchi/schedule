import 'package:flutter/material.dart';
import '../model/transaction.dart';
import '../widget/new_transaction.dart';
import '../widget/transaction_list.dart';

class UserTransaction extends StatefulWidget {
  @override
  _UserTransactionState createState() => _UserTransactionState();
}

class _UserTransactionState extends State<UserTransaction> {
  final List<Transaction> transactions = [];

  void _addNewTransaction (String title, String amount){
    final newTx = Transaction(
      title: title,
      amount: double.parse(amount),
      date: DateTime.now(),
      id: DateTime.now().toString(),
    );

    setState(() {
      transactions.add(newTx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        NewTransaction(_addNewTransaction),
        TransactionList(transactions),
      ],
    );
  }
}