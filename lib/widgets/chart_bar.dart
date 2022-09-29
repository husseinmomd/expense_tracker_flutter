import 'package:flutter/material.dart';

// ignore_for_file: prefer_const_constructors
// ignore_for_file: sort_child_properties_last
class ChartBar extends StatelessWidget {
  // const ChartBar({Key? key}) : super(key: key);
  final String label;
  final double spedingAmount;
  final double spendingPcOfTotal;

  ChartBar(this.label, this.spedingAmount, this.spendingPcOfTotal);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text('\$${spedingAmount.toStringAsFixed(0)}'),
        SizedBox(
          height: 4,
        ),
        Container(
          width: 60,
          height: 10,
          child: Stack(
            children: [
              Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 1.0),
                      color: const Color.fromRGBO(220, 220, 220, 1),
                      borderRadius: BorderRadius.circular(
                        (10),
                      )))
            ],
          ),
        ),
        FractionallySizedBox(
          heightFactor: spendingPcOfTotal,
          child: Container(
              decoration: BoxDecoration(color: Theme.of(context).primaryColor)),
        ),
        SizedBox(
          height: 4,
        ),
        Text(label)
      ],
    );
  }
}
