import 'package:flutter/material.dart';
import 'package:mfa/apis/user.dart';
import 'package:mfa/models/user/user.dart';
import 'package:mfa/models/user_req/user_req.dart';
import 'package:mfa/widgets/basic/app_bar.dart';
import 'package:mfa/widgets/basic/async_data_loader.dart';

class HttpPage extends StatefulWidget {
  const HttpPage({super.key});

  @override
  State<HttpPage> createState() => _HttpPageState();
}

class _HttpPageState extends State<HttpPage> {
  @override
  initState() {
    super.initState();
    // getUserInfo();
  }

  Future<User> getUserInfo() async {
    debugPrint('1');
    User user =
        await loginByPassword(UserReq(password: '123456', username: 'user1'));
    debugPrint(user.username);
    debugPrint('2');

    return user;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppBar(title: '使用Http请求'),
      body: AsyncDataLoader(
        futures: [
          getUserInfo(),
        ],
        builder: (data) {
          User user = data[0];
          return Column(children: [
            Center(
              child: Text('this is name : ${user.username}'),
            )
          ]);
        },
      ),
    );
  }
}
