import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_expences/widgets/new_transaction.dart';
import 'package:flutter_expences/widgets/transaction_list.dart';
import 'package:flutter_expences/widgets/user_transacttion.dart';

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
  // String? titleInput;
  // String? amountInput;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Flutter app"),
        ),
        body: SingleChildScrollView(
          child: Column(
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
              UserTransaction(),
            ],
          ),
        ));
  }
}
