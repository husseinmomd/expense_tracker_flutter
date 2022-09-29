// ignore_for_file: prefer_const_constructors
// ignore_for_file: sort_child_properties_last
import 'package:flutter/material.dart';
import './widgets/tx_list.dart';
import './widgets/new_tx.dart';
import './models/tansaction.dart';
import './widgets/chart.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'fluter app',
      theme: ThemeData(
          primarySwatch: Colors.purple,
          fontFamily: 'Rubik',
          appBarTheme: AppBarTheme(

              // deprecated
              // textTheme: ThemeData.light().textTheme.copyWith()
              )),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _userTransactions = [
    // Transaction(
    //   id: 't1',
    //   title: 'New Shoes',
    //   amount: 69.99,
    //   date: DateTime.now(),
    // ),
    // Transaction(
    //   id: 't2',
    //   title: 'Weekly Groceries',
    //   amount: 16.53,
    //   date: DateTime.now(),
    // )
  ];

  // recent txs
  List<Transaction> get _recentTxs {
    return _userTransactions.where((tx) {
      return tx.date!.isAfter(DateTime.now().subtract(
        Duration(days: 7),
      ));
    }).toList();
  }

  // add new tx function
  void _addNewTx(String txTitle, double txAmount) {
    final newTx = Transaction(
      title: txTitle,
      amount: txAmount,
      date: DateTime.now(),
      id: DateTime.now().toString(),
    );

    setState(() {
      _userTransactions.add(newTx);
    });
  }

  // show bottom modal
  void _showModal(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return GestureDetector(
            onTap: () {},
            child: NewTransaction(_addNewTx),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter App'),
        actions: [
          IconButton(
              onPressed: () => _showModal(context), icon: Icon(Icons.add))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Chart(_recentTxs),
          TransactionList(_userTransactions)
          // UserTransactions(),
        ]),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _showModal(context),
      ),
    );
  }
}
