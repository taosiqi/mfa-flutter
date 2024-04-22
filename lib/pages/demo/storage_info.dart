import 'package:flutter/material.dart';
import 'package:flutter_storage_info/flutter_storage_info.dart';
import 'package:mfa/widgets/basic/app_bar.dart';

class StorageInfoPage extends StatefulWidget {
  const StorageInfoPage({super.key});

  @override
  State<StorageInfoPage> createState() => _StorageInfoPageState();
}

class _StorageInfoPageState extends State<StorageInfoPage> {
  double totalSpace = 0;
  double freeSpace = 0;
  double usedSpace = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppBar(title: 'storage info'),
      body: Center(
        child: Column(
          children: [
            Text('总空间: $totalSpace GB'),
            Text('剩余空间: $freeSpace GB'),
            Text('已使用: $usedSpace GB')
          ],
        ),
      ),
    );
  }

  Future<void> _getStorageInfo() async {
    totalSpace = await FlutterStorageInfo.getStorageFreeSpaceInGB;
    freeSpace = await FlutterStorageInfo.getStorageFreeSpaceInGB;
    usedSpace = await FlutterStorageInfo.getStorageUsedSpaceInGB;
    setState(() {});
  }

  @override
  void initState() {
    _getStorageInfo();
    super.initState();
  }
}
