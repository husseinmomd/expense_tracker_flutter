import 'package:flutter/material.dart';

// ignore_for_file: prefer_const_constructors
// ignore_for_file: sort_child_properties_last
class NewTransaction extends StatefulWidget {
  final Function(String, double) addTx;
  NewTransaction(this.addTx);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  void submitDate() {
    final enteredTitle = titleControler.text;
    final enteredAmount = double.parse(amountControler.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0) return;

    widget.addTx(
      enteredTitle,
      enteredAmount,
    );

    // close modal after adding data
    Navigator.of(context).pop();
  }

  final titleControler = TextEditingController();

  final amountControler = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
          TextField(
            decoration: InputDecoration(labelText: 'Title'),
            controller: titleControler,
            onSubmitted: (_) => submitDate(),
          ),
          TextField(
            decoration: InputDecoration(labelText: 'Amount'),
            controller: amountControler,
            keyboardType: TextInputType.number,
            onSubmitted: (_) => submitDate(),
          ),
          TextButton(
            onPressed: submitDate,
            child: Text('Add Transaction'),
            style: TextButton.styleFrom(primary: Colors.purple),
          ),
        ]),
      ),
    );
  }
}
