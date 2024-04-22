import 'package:flutter/material.dart';
import 'package:mfa/widgets/basic/app_bar.dart';
import 'package:mfa/widgets/basic/button.dart';
import 'package:share_plus/share_plus.dart';

class SharePlusPage extends StatefulWidget {
  const SharePlusPage({super.key});

  @override
  State<SharePlusPage> createState() => _SharePlusPageState();
}

class _SharePlusPageState extends State<SharePlusPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppBar(title: 'share plus'),
      body: Center(
        child: Column(
          children: [
            Button(
              '分享',
              onPressed: () {
                _onShare();
                debugPrint('print');
              },
            ),
          ],
        ),
      ),
    );
  }

  void _onShare() {
    Share.share('check out my website https://example.com',
        subject: 'Look what I made!');
  }

  @override
  void initState() {
    super.initState();
  }
}
