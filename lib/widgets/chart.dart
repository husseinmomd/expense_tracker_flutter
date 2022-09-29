import 'package:flutter/material.dart';
import '../models/tansaction.dart';
import 'package:intl/intl.dart';
import './chart_bar.dart';

// ignore_for_file: prefer_const_constructors
// ignore_for_file: sort_child_properties_last

class Chart extends StatelessWidget {
  // const Chart({Key? key}) : super(key: key);
  List<Transaction> recentTxs;
  Chart(this.recentTxs);

  List<Map<String, Object>> get groupTxValues {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));

      // sum up all txs that happened on this day
      double totalSum = 0.0;
      for (var i = 0; i < recentTxs.length; i++) {
        if (recentTxs[i].date?.day == weekDay.day &&
            recentTxs[i].date?.month == weekDay.month &&
            recentTxs[i].date?.year == weekDay.year) {
          totalSum += recentTxs[i].amount!;
        }
      }

      print(DateFormat.E().format(weekDay));
      print(totalSum);

      return {
        "day": DateFormat.E().format(weekDay).substring(0, 1),
        "amount": totalSum
      };
    });
  }

// calc total spending
  double get totalSpending {
    return groupTxValues.fold(0.0, (sum, item) {
      return sum + (item['amount'] as double);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: groupTxValues.map((data) {
          return ChartBar(
              data['day'].toString(),
              (data['amount'] as double),
              totalSpending == 0.0
                  ? 0.0
                  : (data['amount'] as double) / totalSpending);
        }).toList(),
      ),
    );
  }
}
