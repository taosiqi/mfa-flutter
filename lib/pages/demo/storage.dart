import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mfa/widgets/basic/app_bar.dart';
import 'package:mfa/widgets/basic/button.dart';

class StoragePage extends StatefulWidget {
  const StoragePage({super.key});

  @override
  State<StoragePage> createState() => _StoragePageState();
}

class _StoragePageState extends State<StoragePage> {
  final box = GetStorage();
  int testNum = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppBar(title: 'storage'),
      body: Center(
        child: Column(
          children: [
            Button(
              '写入',
              onPressed: () {
                box.write('testNum', testNum + 1);
              },
            ),
            Text(testNum.toString()),
            Button(
              '读取',
              onPressed: () {
                setState(() {
                  testNum = box.read('testNum');
                });
              },
            )
          ],
        ),
      ),
    );
  }
}
