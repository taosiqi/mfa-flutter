import 'package:day/day.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mfa/widgets/basic/app_bar.dart';

class DayPage extends StatefulWidget {
  const DayPage({super.key});

  @override
  State<DayPage> createState() => _DayPageState();
}

class _DayPageState extends State<DayPage> {
  final day = Day().format('YYYY-MM-DD HH:mm:ss ');
  final year = Day().year().toString();
  final month = Day().month().toString();
  final weekday = Day().weekday().toString();
  DateFormat dateFormat = DateFormat('yyyy-MM-dd HH:mm:ss');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppBar(title: 'dayjs'),
      body: Center(
        child: Column(
          children: [
            Text(day),
            Text(year),
            Text(month),
            Text(weekday),
            Text(dateFormat.format(DateTime.now())),
          ],
        ),
      ),
    );
  }
}
