import 'package:flutter/material.dart';
import 'package:mfa/widgets/basic/AppBar.dart';

typedef ListMapper<X> = Map<String, X>;

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  List<ListMapper<int>> data = [
    {'a': 1, 'b': 2, 'c': 3},
    {'a': 1, 'b': 2, 'c': 3}
  ];

  ListMapper<dynamic> data2 = {'a': 1, 'b': 2, 'c': '3'};

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
