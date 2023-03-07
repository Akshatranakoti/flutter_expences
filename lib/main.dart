import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import './transaction.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<Transaction> transactions = [
    Transaction(
      id: 't1',
      title: 'newshoes',
      amount: 100.1,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'weekly grocery',
      amount: 100,
      date: DateTime.now(),
    ),
  ];
  // String? titleInput;
  // String? amountInput;
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Flutter app"),
        ),
        body: Column(
          //mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              width: double.infinity,
              child: Card(
                color: Colors.orange,
                elevation: 9,
                child: Text("Chart"),
              ),
            ),
            Card(
              elevation: 5,
              child: Container(
                padding: EdgeInsets.all(10),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      TextField(
                        decoration: InputDecoration(labelText: 'Title'),
                        controller: titleController,
                        // onChanged: (value) {
                        //   titleInput = value;

                        // },
                      ),
                      TextField(
                        decoration: InputDecoration(labelText: 'Amount'),
                        controller: amountController,
                        // onChanged: (value) => amountInput = value,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      TextButton(
                          onPressed: () {
                            // print(titleInput);
                            // print(amountInput);
                            print(titleController.text);
                          },
                          child: Text('Add Transaction'))
                    ]),
              ),
            ),
            Column(
              children: transactions.map((tx) {
                return Card(
                    elevation: 5,
                    child: Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              border:
                                  Border.all(color: Colors.purple, width: 2)),
                          child: Text(
                            '\$${tx.amount}',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                color: Colors.purple),
                          ),
                          padding: EdgeInsets.all(10),
                          margin: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 15),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              tx.title.toString(),
                              // ignore: prefer_const_constructors
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                            Text(
                              DateFormat.yMMMEd().format(tx.date),
                              style: TextStyle(color: Colors.grey),
                            )
                          ],
                        )
                      ],
                    ));
              }).toList(),
            )
          ],
        ));
  }
}
