import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:mfa/widgets/basic/Icon.dart';

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
          style: TextStyle(fontSize: 22),
        ),
        centerTitle: false,
      ),
      drawer: Drawer(
          width: 250,
          backgroundColor: Colors.white,
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
            ElevatedButton(
                onPressed: () async {
                  // PackageInfo packageInfo = await PackageInfo.fromPlatform();
                  // debugPrint(packageInfo.version);
                  // debugPrint(packageInfo.buildNumber);
                  // debugPrint(packageInfo.packageName);
                  // debugPrint('kReleaseMode: $kReleaseMode');
                  Navigator.pushNamed(context, "login");
                },
                style: ElevatedButton.styleFrom(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(18)),
                  ),
                ),
                child: const Text('Login')),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('$_counter',
                  // textScaleFactor: 1.5,
                  style: const TextStyle(
                    fontSize: 50,
                    color: Colors.blue,
                  )),
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
