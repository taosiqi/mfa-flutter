import 'package:flutter/material.dart';
import 'package:mfa/apis/user.dart';
import 'package:mfa/models/user/user.dart';
import 'package:mfa/widgets/basic/app_bar.dart';

class HttpPage extends StatefulWidget {
  const HttpPage({super.key});

  @override
  State<HttpPage> createState() => _HttpPageState();
}

class _HttpPageState extends State<HttpPage> {
  User? userInfo;

  @override
  initState() {
    super.initState();
    getUserInfo();
  }

  getUserInfo() async {
    User user = await loginByPassword('user1', '1234568');
    setState(() {
      userInfo = user;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppBar(title: '使用Http请求'),
      body: Center(
        child: Column(
          children: [
            userInfo == null
                ? const CircularProgressIndicator()
                : Text("name is ${userInfo!.username}")
          ],
        ),
      ),
    );
  }
}
