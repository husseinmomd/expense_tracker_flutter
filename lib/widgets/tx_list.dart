import 'package:expense_tracker/models/tansaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// ignore_for_file: prefer_const_constructors
// ignore_for_file: sort_child_properties_last

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      child: transactions.isEmpty
          ? Column(
              children: <Widget>[
                Text(
                  'No Transactions added yet!',
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  height: 200,
                  child: Image.asset(
                    'assets/imgs/pngwing.com.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            )
          : ListView.builder(
              itemBuilder: (ctx, index) {
                return Card(
                  child: Row(children: [
                    Container(
                      margin:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                      child: Text(
                        '\$ ${transactions[index].amount?.toStringAsFixed(2)}',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Theme.of(context).primaryColor),
                      ),
                      decoration: BoxDecoration(
                          border: Border.all(
                        color: Theme.of(context).primaryColor,
                        width: 2,
                      )),
                      padding: EdgeInsets.all(10),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          transactions[index].title!,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          DateFormat.yMMM().format(transactions[index].date!),
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    )
                  ]),
                );
              },
              itemCount: transactions.length,
            ),
    );
  }
}
