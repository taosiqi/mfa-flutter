import 'package:flutter/material.dart';

import '../widgets/appBar.dart';

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
  Widget build(BuildContext context) {
    double statusBarHeight = MediaQuery.of(context).padding.top;

    return Scaffold(
      appBar: CustomAppBar(title: 'MFA二次验证码', key: UniqueKey()),
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
                  child: Builder(
                    // 用Builder把context暴露出来，以便Scaffold.of(context)可以使用
                    // context会向上查找最近的Scaffold widget
                    builder: (context) => IconButton(
                      onPressed: () {
                        // 这是一种查找方法
                        //最优的是什么
                        // Container? container =
                        //     context.findAncestorWidgetOfExactType<Container>();
                        // print(container?.padding);
                        Scaffold.of(context).closeDrawer();
                      },
                      icon: const Icon(Icons.menu_outlined),
                    ),
                  )),
            ],
          )),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
                onPressed: () {
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
                  textScaleFactor: 2.0,
                  style: const TextStyle(
                    fontSize: 50,
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
}
