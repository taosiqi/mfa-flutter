import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mfa/widgets/basic/app_bar.dart';
import 'package:mfa/widgets/basic/icon.dart';

class IconPage extends StatefulWidget {
  const IconPage({super.key});

  @override
  State<IconPage> createState() => _IconPageState();
}

class _IconPageState extends State<IconPage> {
  final box = GetStorage();
  int testNum = 0;

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: BasicAppBar(title: 'icon'),
      body: Center(
        child: Column(
          children: [
            Icon(
              AntdIcons.arrawsalt,
              size: 40,
            ),
            Icon(
              AntdIcons.accountBookFill,
              size: 40,
            ),
            Icon(
              AntdIcons.alert,
              size: 40,
            ),
            Icon(
              AntdIcons.backward,
              size: 40,
            ),
            Icon(
              AntdIcons.barcode,
              size: 40,
            ),
            Icon(
              AntdIcons.saveFill,
              size: 40,
            ),
            Icon(
              AntdIcons.taobao,
              size: 40,
            ),
            Icon(
              AntdIcons.weibo,
              size: 40,
            ),
            Icon(
              AntdIcons.weibo,
              size: 40,
            ),
          ],
        ),
      ),
    );
  }
}
