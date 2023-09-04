import 'package:flutter/material.dart';
import 'package:mfa/widgets/basic/AppBar.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: BasicAppBar(title: '登陆'),
      body: Center(
        child: Text('Login'),
      ),
    );
  }
}
