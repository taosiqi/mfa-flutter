import 'package:flutter/material.dart';
import 'package:mfa/widgets/basic/app_bar.dart';
import 'package:mfa/widgets/basic/button.dart';

typedef ListMapper<X> = Map<String, X>;

class MyData {
  final int a;
  final int b;
  final int c;

  MyData({required this.a, required this.b, required this.c});
}

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

  List<MyData> data3 = [
    MyData(a: 1, b: 2, c: 3),
    MyData(a: 1, b: 2, c: 3),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const BasicAppBar(title: '登陆'),
        body: Center(
          child: Column(
            children: [
              const Text('Login'),
              Button(
                'Button1',
                onPressed: () {
                  debugPrint(data.toString());
                },
              ),
              Button(
                'Button2',
                onPressed: () {
                  final {"a": value} = data2;
                  debugPrint(value.toString());
                },
              ),
              Button(
                'Button3',
                onPressed: () {
                  for (MyData element in data3) {
                    debugPrint(element.a.toString());
                  }
                },
              ),
            ],
          ),
        ));
  }
}
