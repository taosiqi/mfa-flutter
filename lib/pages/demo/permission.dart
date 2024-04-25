import 'package:flutter/material.dart';
import 'package:mfa/widgets/basic/app_bar.dart';
import 'package:mfa/widgets/basic/button.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionPage extends StatefulWidget {
  const PermissionPage({super.key});

  @override
  State<PermissionPage> createState() => _PermissionPageState();
}

class _PermissionPageState extends State<PermissionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppBar(title: 'permission handle'),
      body: Center(
        child: Column(
          children: [
            Button(
              '请求相机权限',
              onPressed: () => {getCameraPermission()},
            ),
            Button(
              '请求定位权限',
              onPressed: () => {getLocationPermission()},
            ),
            Button(
              '请求永久定位权限',
              onPressed: () => {getLocationAlwaysPermission()},
            )
          ],
        ),
      ),
    );
  }

  getCameraPermission() async {
    PermissionStatus status = await Permission.camera.request();
    debugPrint('权限：${status.isGranted}');
    if (status.isDenied) {
      openAppSettings();
    }
  }

  getLocationPermission() async {
    PermissionStatus status = await Permission.location.request();
    debugPrint('权限：${status.isGranted}');
    // 没有权限打开设置
    if (status.isDenied) {
      openAppSettings();
    }
  }

  getLocationAlwaysPermission() async {
    PermissionStatus status = await Permission.locationAlways.request();
    debugPrint('权限：${status.isGranted}');
    // 没有权限打开设置
    if (status.isDenied) {
      openAppSettings();
    }
  }
}
