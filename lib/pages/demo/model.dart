import 'package:flutter/material.dart';
import 'package:mfa/models/user/user.dart';
import 'package:mfa/widgets/basic/AppBar.dart';

class ModelPage extends StatefulWidget {
  const ModelPage({super.key});

  @override
  State<ModelPage> createState() => _ModelPageState();
}

class _ModelPageState extends State<ModelPage> {
  var u = User.fromJson({
    "id": 1296269,
    "node_id": "MDEwOlJlcG9zaXRvcnkxMjk2MjY5",
    "owner": {"login": "小猪努力学前端"},
    "private": false,
    "topics": ["octocat", "atom", "electron", "api"],
    "permissions": {"admin": false, "push": false, "pull": true},
    "security_and_analysis": {
      "advanced_security": {"status": "enabled"},
      "secret_scanning": {"status": "enabled"},
      "secret_scanning_push_protection": {"status": "disabled"}
    }
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppBar(title: '使用model 使用Json数据'),
      body: Center(
        child: Column(
          children: [
            Text(u.owner.login),
          ],
        ),
      ),
    );
  }
}
