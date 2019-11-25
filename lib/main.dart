import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import './transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
    
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {

  final List<Transaction> transactions = [
    Transaction(
      id: '01',
      title: 'New shoes',
      amount: 69.99,
      date: DateTime.now(),
    ),
    Transaction(
      id: '02',
      title: 'New belts',
      amount: 17.99,
      date: DateTime.now(),
    )
  ];

  final titleController = TextEditingController();
  final amountController = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text( 'Flutter App'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            width: double.infinity,
            child: Card(
              color: Colors.blue,
              child: Text('Chart'),
            ),
          ),
          Card(
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
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ),
          Column(
            children: transactions.map(
              (tx) {
                return Card(
                  child: Row(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 15,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black,
                            width: 2,
                          )
                        ),
                        padding: EdgeInsets.all(10),
                        child: Text(
                          '\$${tx.amount}',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.purple
                          )
                          ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text( 
                            tx.title.toString(),
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),),
                          Text( DateFormat.yMMMd().format(tx.date)),
                        ],
                      )
                    ],
                  ),
                );
              }
            ).toList(),
          )
        ],
      ),
    );
  }
  
}


