import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final Function addTransaction;
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  NewTransaction(this.addTransaction);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
              elevation: 5,
              child: Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    TextField(
                      decoration: InputDecoration( labelText: 'Title'),
                      controller: titleController,
                    ),
                    TextField(
                      decoration: InputDecoration( labelText: 'Amount'),
                      controller: amountController,
                    ),
                    FlatButton(
                      child: Text('Add Transactions'),
                      textColor: Colors.purple,
                      onPressed: () { addTransaction(titleController.text, amountController.text); },
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}