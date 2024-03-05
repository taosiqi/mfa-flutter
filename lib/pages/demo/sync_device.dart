import 'package:flutter/material.dart';
import 'package:mfa/utils/deviceInfo.dart';
import 'package:mfa/widgets/basic/app_bar.dart';
import 'package:mfa/widgets/basic/async_data_loader.dart';

class SyncDevicePage extends StatefulWidget {
  const SyncDevicePage({super.key});

  @override
  State<SyncDevicePage> createState() => _SyncDevicePageState();
}

class _SyncDevicePageState extends State<SyncDevicePage> {
  @override
  void initState() {
    super.initState();
  }

  Future<void> sleep() async {
    return Future.delayed(const Duration(seconds: 4));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppBar(title: 'async device info'),
      body: AsyncDataLoader(
        futures: [DeviceInfoUtil.getDeviceInfo(), sleep()],
        builder: (data) {
          DeviceInfo deviceInfo = data[0];
          var (:deviceName, :systemVersion, :appVersion, :appName) = deviceInfo;
          return Center(
            child: Column(
              children: [
                Text(deviceName),
                Text(systemVersion),
                Text(appVersion),
                Text(appName),
              ],
            ),
          );
        },
      ),
    );
  }
}
