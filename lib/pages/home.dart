import 'package:dart_totp/dart_totp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:go_router/go_router.dart';
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
                context.push('/login');
              },
            ),
            Button(
              'To Provider',
              onPressed: () {
                context.push('/provider');
              },
            ),
            Button(
              'To List',
              onPressed: () {
                context.push('/list');
              },
            ),
            Button(
              'To Dialog',
              onPressed: () {
                context.push('/dialog');
              },
            ),
            Button(
              'To Form',
              onPressed: () {
                context.push('/form');
              },
            ),
            Button(
              'To Page View',
              onPressed: () {
                context.push('/viewPage');
              },
            ),
            Button(
              'To Day',
              onPressed: () {
                context.push('/day');
              },
            ),
            Button(
              'To Other',
              onPressed: () {
                context.push('/other');
              },
            ),
            Button(
              'To Webview',
              onPressed: () {
                context.push('/webview');
              },
            ),
            Button(
              'To Model',
              onPressed: () {
                context.push('/model');
              },
            ),
            Button(
              'To Adaptive',
              onPressed: () {
                context.push('/adaptive');
              },
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                  'totp ${TOTP.generateTOTP('KVARB3JSYG6RNYY7HJX2N6ZTUSOXU5RK')}'),
            )
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
