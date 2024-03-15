import 'package:flutter/material.dart';
import 'package:mfa/widgets/basic/app_bar.dart';
import 'package:mfa/widgets/basic/button.dart';
import 'package:oktoast/oktoast.dart';

class ToastPage extends StatefulWidget {
  const ToastPage({super.key});

  @override
  State<ToastPage> createState() => _ToastPageState();
}

class _ToastPageState extends State<ToastPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppBar(title: 'toast'),
      body: Center(
        child: Column(
          children: [
            Button('吐司',
                onPressed: () => {
                      showToast('content',
                          textPadding:
                              const EdgeInsets.fromLTRB(20, 10, 20, 10))
                    })
          ],
        ),
      ),
    );
  }
}
