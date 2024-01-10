import 'package:flutter/material.dart';
import 'package:mfa/models/user/user.dart';
import 'package:mfa/widgets/basic/app_bar.dart';

class ModelPage extends StatefulWidget {
  const ModelPage({super.key});

  @override
  State<ModelPage> createState() => _ModelPageState();
}

class _ModelPageState extends State<ModelPage> {
  var u = User.fromJson({
    "username": "user1",
    "email": "",
    "open_id": "oupNV48-JG37YoY6F4H78ulZouk8",
    "password": "",
    "gender": "2",
    "phone": "",
    "profile_picture_url":
        "https://6d66-mfa-view-2g2ye6bi6948acdd-1258967922.tcb.qcloud.la/img/avatar.png",
    "is_deleted": false,
    "created_at": 1704706894508,
    "updated_at": 1704870248582,
    "token": "eyJhbGciOiJIUzI1NiIsInR5-mlIp80UUCoD8KoLkE"
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppBar(title: '使用model 使用Json数据'),
      body: Center(
        child: Column(
          children: [
            Text(u.username),
          ],
        ),
      ),
    );
  }
}
