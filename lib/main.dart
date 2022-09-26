// ignore_for_file: prefer_const_constructors
// ignore_for_file: sort_child_properties_last
import 'package:flutter/material.dart';
import './widgets/user_tx.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  // State<StatefulWidget> createState() => _MyHomePage();
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'fluter app',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Home'),
        ),
        body: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                width: double.infinity,
                child: Card(
                  color: Colors.blue,
                  elevation: 5,
                  child: Text('Chart!'),
                ),
              ),
              UserTransactions(),
            ]),
      ),
    );
  }
}
