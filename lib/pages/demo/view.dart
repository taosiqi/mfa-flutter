import 'package:flutter/material.dart';
import 'package:mfa/widgets/basic/app_bar.dart';

class ViewPage extends StatelessWidget {
  const ViewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: const BasicAppBar(title: 'PageView'),
      body: PageView(
        allowImplicitScrolling: true,
        onPageChanged: (index) => {debugPrint(index.toString())},
        children: [
          Container(
            color: Colors.blue,
            width: 200,
            height: 200, //宽高无效，Container会撑大父元素
          ),
          Container(color: Colors.cyan),
          Container(color: Colors.red)
        ],
      ),
    );
  }
}
