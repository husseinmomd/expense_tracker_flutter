import 'package:flutter/material.dart';

// ignore_for_file: prefer_const_constructors
// ignore_for_file: sort_child_properties_last
class NewTransaction extends StatelessWidget {
  final VoidCallback addTx;
  NewTransaction({required this.addTx});

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
          ),
          TextField(
            decoration: InputDecoration(labelText: 'Amount'),
            controller: amountControler,
          ),
          TextButton(
            onPressed: () {
              addTx(
                titleControler,
                double.parse(amountControler),
              );
            },
            child: Text('Add Transaction'),
            style: TextButton.styleFrom(primary: Colors.purple),
          ),
        ]),
      ),
    );
  }
}
