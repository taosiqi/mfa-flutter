import 'package:day/day.dart';
import 'package:flutter/material.dart';
import 'package:mfa/widgets/basic/AppBar.dart';

class DayPage extends StatelessWidget {
  DayPage({Key? key}) : super(key: key);
  final day = Day().format('YYYY-MM-DD HH:mm:ss ');
  final year = Day().year().toString();
  final month = Day().month().toString();
  final weekday = Day().weekday().toString();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppBar(title: 'dayjs'),
      body: Center(
        child: Column(
          children: [Text(day), Text(year), Text(month), Text(weekday)],
        ),
      ),
    );
  }
}
