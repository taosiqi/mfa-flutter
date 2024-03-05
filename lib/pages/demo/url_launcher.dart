import 'package:flutter/material.dart';
import 'package:mfa/widgets/basic/app_bar.dart';
import 'package:url_launcher/url_launcher.dart';

class UrlLauncherPage extends StatefulWidget {
  const UrlLauncherPage({super.key});

  @override
  State<UrlLauncherPage> createState() => _UrlLauncherPageState();
}

class _UrlLauncherPageState extends State<UrlLauncherPage> {
  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }

  Future<void> _makeSmsCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'sms',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }

  Future<void> _makeEmailCall(String emailPath) async {
    final Uri launchUri = Uri(
      scheme: 'mailto',
      path: emailPath,
    );
    await launchUrl(launchUri);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppBar(title: 'url launcher'),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () => {_makePhoneCall('1234567890')},
              child: const Text('打电话'),
            ),
            ElevatedButton(
              onPressed: () => {_makeSmsCall('1234567890')},
              child: const Text('发信息'),
            ),
            ElevatedButton(
              onPressed: () => {_makeEmailCall('example@example.com')},
              child: const Text('发邮件'),
            ),
          ],
        ),
      ),
    );
  }
}
