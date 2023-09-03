import 'package:flutter/material.dart';

import '../widgets/appBar.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: '登陆', key: UniqueKey()),
      body: const Center(
        child: Text('Login'),
      ),
    );
  }
}
