import 'package:flutter/material.dart';
import 'package:mfa/widgets/basic/AppBar.dart';
import 'package:mfa/widgets/basic/SafeScrollView.dart';

class ListPage extends StatelessWidget {
  const ListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> items = List<String>.generate(50, (i) => 'Item $i');
    return Scaffold(
        appBar: const BasicAppBar(title: '列表'),
        body: SafeScrollView(
          child: Column(
            children: items.map((e) => Text(e)).toList(),
          ),
        ));
  }
}
