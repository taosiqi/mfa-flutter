import 'package:dart_totp/dart_totp.dart';
import 'package:flutter/material.dart';
import 'package:mfa/widgets/basic/app_bar.dart';

class TotpPage extends StatefulWidget {
  const TotpPage({super.key});

  @override
  State<TotpPage> createState() => _TotpPageState();
}

class _TotpPageState extends State<TotpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const BasicAppBar(title: 'totp'),
        body: Center(
          child: Text(
            'totp ${TOTP.generateTOTP('KVARB3JSYG6RNYY7HJX2N6ZTUSOXU5RK')}',
            style: const TextStyle(fontSize: 40),
          ),
        ));
  }
}
