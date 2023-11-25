import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:mfa/utils/Platform.dart';
import 'package:mfa/widgets/basic/Button.dart';
import 'package:mfa/widgets/basic/Icon.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 3000), () {
      debugPrint('init over');
      FlutterNativeSplash.remove(); //关闭开屏海报
    });
  }

  @override
  Widget build(BuildContext context) {
    double statusBarHeight = MediaQuery.of(context).padding.top;

    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: getSystemUiOverlayStyle(context),
        leading: Builder(
          builder: (context) => IconButton(
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            icon: const Icon(Icons.menu_outlined),
          ),
        ),
        title: const Text(
          'MFA二次验证码',
          style: TextStyle(fontSize: 22),
        ),
        titleSpacing: 0,
        centerTitle: false,
      ),
      drawer: Drawer(
          width: 250,
          surfaceTintColor: Colors.transparent,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.zero,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.only(top: statusBarHeight, left: 22),
                child: buildContainer(),
              ),
            ],
          )),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Wrap(
          spacing: 10,
          runSpacing: 10,
          // alignment: WrapAlignment.center,
          children: <Widget>[
            Button(
              'To Login',
              onPressed: () {
                Navigator.pushNamed(context, "login");
              },
            ),
            Button(
              'To Provider',
              onPressed: () {
                Navigator.pushNamed(context, "provider");
              },
            ),
            Button(
              'To List',
              onPressed: () {
                Navigator.pushNamed(context, "list");
              },
            ),
            Button(
              'To Dialog',
              onPressed: () {
                Navigator.pushNamed(context, "dialog");
              },
            ),
            Button(
              'To Form',
              onPressed: () {
                Navigator.pushNamed(context, "form");
              },
            ),
            Button(
              'To Page View',
              onPressed: () {
                Navigator.pushNamed(context, "viewPage");
              },
            ),
            Button(
              'To Day',
              onPressed: () {
                Navigator.pushNamed(context, "day");
              },
            ),
          ],
        ),
      ),
    );
  }

  Builder buildContainer() {
    return Builder(
      builder: (context) => IconButton(
        onPressed: () {
          Scaffold.of(context).closeDrawer();
        },
        icon: const Icon(AntdIcons.calendar),
      ),
    );
  }
}
