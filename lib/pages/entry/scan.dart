import 'package:flutter/material.dart';
import 'package:mfa/widgets/basic/AppBar.dart';

class ScanPage extends StatefulWidget {
  const ScanPage({super.key});

  @override
  State<ScanPage> createState() => _ScanPageState();
}

class _ScanPageState extends State<ScanPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: BasicAppBar(title: '扫码'),
      body: Center(
        child: Text('EntryPage'),
      ),
    );
  }
}
