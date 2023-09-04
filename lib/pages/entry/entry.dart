import 'package:flutter/material.dart';
import 'package:mfa/widgets/basic/AppBar.dart';

class EntryPage extends StatefulWidget {
  const EntryPage({super.key});

  @override
  State<EntryPage> createState() => _EntryPageState();
}

class _EntryPageState extends State<EntryPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: BasicAppBar(title: '输入'),
      body: Center(
        child: Text('EntryPage'),
      ),
    );
  }
}
