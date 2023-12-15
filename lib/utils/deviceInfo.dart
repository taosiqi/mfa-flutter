import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:package_info_plus/package_info_plus.dart';

// class DeviceInfo {
//   final String deviceName;
//   final String systemVersion;
//   final String appName;
//   final String appVersion;
//
//   DeviceInfo({
//     required this.deviceName,
//     required this.systemVersion,
//     required this.appName,
//     required this.appVersion,
//   });
// }

typedef DeviceInfo = ({
  String deviceName,
  String systemVersion,
  String appName,
  String appVersion
});

class DeviceInfoUtil {
  static final DeviceInfoPlugin _deviceInfoPlugin = DeviceInfoPlugin();

  static Future<DeviceInfo> getDeviceInfo() async {
    String deviceName = '';
    String systemVersion = '';

    if (Platform.isIOS) {
      final iosDeviceInfo = await _deviceInfoPlugin.iosInfo;
      deviceName = iosDeviceInfo.name ?? 'Unknown';
      systemVersion = iosDeviceInfo.systemVersion ?? 'Unknown';
    } else if (Platform.isAndroid) {
      final androidDeviceInfo = await _deviceInfoPlugin.androidInfo;
      deviceName = androidDeviceInfo.brand ?? 'Unknown';
      systemVersion = androidDeviceInfo.version.codename ?? 'Unknown';
    }

    final PackageInfo packageInfo = await PackageInfo.fromPlatform();
    final String appName = packageInfo.appName;
    final String appVersion = packageInfo.version;

    return (
      deviceName: deviceName,
      systemVersion: systemVersion,
      appName: appName,
      appVersion: appVersion,
    );
  }
}
