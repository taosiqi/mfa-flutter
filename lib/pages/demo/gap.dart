import 'package:flutter/material.dart';
import 'package:mfa/widgets/basic/app_bar.dart';

class GapPage extends StatefulWidget {
  const GapPage({super.key});

  @override
  State<GapPage> createState() => _GapPageState();
}

class _GapPageState extends State<GapPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        appBar: BasicAppBar(title: 'gap'),
        body: Center(
          child: Column(
            // spacing: 100.0,
            children: [
              Text(
                'gap1',
                style: TextStyle(fontSize: 30),
              ),
              Text(
                'gap2',
                style: TextStyle(fontSize: 30),
              ),
              Text(
                'gap3',
                style: TextStyle(fontSize: 30),
              )
            ],
          ),
        ));
  }
}
