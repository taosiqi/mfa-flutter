import 'package:flutter/material.dart';
import 'package:mfa/providers/count.dart';
import 'package:mfa/providers/person.dart';
import 'package:mfa/widgets/basic/app_bar.dart';
import 'package:mfa/widgets/basic/button.dart';
import 'package:provider/provider.dart';

class ProvidePage extends StatelessWidget {
  const ProvidePage({super.key});

  @override
  Widget build(BuildContext context) {
    final counter = Provider.of<CountNotifier>(context);
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: const BasicAppBar(title: '状态管理'),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              counter.count.toString(),
              style: TextStyle(fontSize: 40, color: colorScheme.primary),
            ),
            Button(
              'Provider.of',
              onPressed: () {
                counter.increment();
              },
            ),
            // Consumer 有个 Widget? child，它非常重要，能够在复杂项目中，极大地缩小你的控件刷新范围。
            Consumer(
              builder: (BuildContext context, Person person, Widget? child) {
                return Column(
                  children: [
                    Text(
                      "${person.age}",
                      style:
                          TextStyle(fontSize: 40, color: colorScheme.primary),
                    ),
                    Button(
                      'Consumer',
                      onPressed: () => person.changAge(),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
