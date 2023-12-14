import 'package:flutter/material.dart';
import 'package:mfa/utils/DeviceInfo.dart';
import 'package:mfa/widgets/basic/AppBar.dart';

class DevicePage extends StatefulWidget {
  const DevicePage({super.key});

  @override
  State<DevicePage> createState() => _DevicePageState();
}

class _DevicePageState extends State<DevicePage> {
  DeviceInfo? _deviceInfo;

  Future<void> _initDeviceInfo() async {
    final deviceInfo = await DeviceInfoUtil.getDeviceInfo();

    setState(() {
      _deviceInfo = deviceInfo;
    });
  }

  @override
  void initState() {
    super.initState();
    _initDeviceInfo();
  }

  @override
  Widget build(BuildContext context) {
    if (_deviceInfo == null) {
      return const SizedBox.shrink();
    } else {
      return Scaffold(
        appBar: const BasicAppBar(title: 'device info'),
        body: Center(
          child: Column(
            children: [
              Text(_deviceInfo!.deviceName),
              Text(_deviceInfo!.systemVersion),
              Text(_deviceInfo!.appVersion),
              Text(_deviceInfo!.appName),
            ],
          ),
        ),
      );
    }
  }
}
