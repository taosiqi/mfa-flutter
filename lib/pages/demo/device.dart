import 'package:flutter/material.dart';
import 'package:mfa/utils/DeviceInfo.dart';
import 'package:mfa/widgets/basic/AppBar.dart';

class DevicePage extends StatefulWidget {
  const DevicePage({super.key});

  @override
  State<DevicePage> createState() => _DevicePageState();
}

class _DevicePageState extends State<DevicePage> {
  DeviceInfo? deviceInfo;

  Future<void> initDeviceInfo() async {
    final data = await DeviceInfoUtil.getDeviceInfo();

    setState(() {
      deviceInfo = data;
    });
  }

  @override
  void initState() {
    super.initState();
    initDeviceInfo();
  }

  @override
  Widget build(BuildContext context) {
    if (deviceInfo == null) {
      return const SizedBox.shrink();
    } else {
      return Scaffold(
        appBar: const BasicAppBar(title: 'device info'),
        body: Center(
          child: Column(
            children: [
              Text(deviceInfo!.deviceName),
              Text(deviceInfo!.systemVersion),
              Text(deviceInfo!.appVersion),
              Text(deviceInfo!.appName),
            ],
          ),
        ),
      );
    }
  }
}
