import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:mfa/widgets/basic/Icon.dart';

import '../widgets/basic/Button.dart';

TextStyle textStyle = const TextStyle(
  fontSize: 30, //字体大小
  color: Colors.deepOrange, //字体颜色
  decoration: TextDecoration.lineThrough, //设置删除线
  decorationColor: Colors.green, //删除线颜色为绿色
  decorationStyle: TextDecorationStyle.wavy, //删除线为波浪线
  fontWeight: FontWeight.bold, //加粗
  fontStyle: FontStyle.italic, //斜体
);

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _counter = 0;
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  void initState() {
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
        systemOverlayStyle: SystemUiOverlayStyle.dark,
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
        ),
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'MFA二次验证码',
              style: textStyle,
            ),
            Button(
              onPressed: () {
                Navigator.pushNamed(context, "login");
              },
              text: 'LoginLoginLoginLoginLogin',
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('$_counter',
                  // textScaleFactor: 1.5,
                  style: const TextStyle(
                    fontSize: 50,
                    // color: Colors.blue,
                  )),
            ),
            Image.asset(
              'assets/images/tv.png',
              height: 100,
              width: 100,
              fit: BoxFit.contain,
            ),
            Image.network(
              'https://static-1253419794.cos.ap-nanjing.myqcloud.com/img/14883291_0_final.png',
              width: 50,
              height: 50,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
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
