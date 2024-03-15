import 'package:flutter/material.dart';
import 'package:mfa/widgets/basic/app_bar.dart';
import 'package:mfa/widgets/basic/button.dart';
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
        queryParameters: {'subject': 'Example'});
    debugPrint(launchUri.toString());
    await launchUrl(launchUri);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppBar(title: 'url launcher'),
      body: Center(
        child: Column(
          children: [
            Button(
              '打电话',
              onPressed: () => {_makePhoneCall('1234567890')},
            ),
            Button(
              '发信息',
              onPressed: () => {_makeSmsCall('1234567890')},
            ),
            Button(
              '发邮件',
              onPressed: () => {_makeEmailCall('John.Doe@example.com')},
            ),
          ],
        ),
      ),
    );
  }
}
