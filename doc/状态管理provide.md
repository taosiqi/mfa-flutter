# 状态管理

>https://juejin.cn/post/7067356022272163847#heading-7
https://tehub.com/a/b7yfehvp38
https://www.jianshu.com/p/db5a42074cdd

刚开始确实被`Provider`疑惑到
> 同步更新不代表同步更新UI，也可能只是值更新了。是否同步
更新UI取决了使用了哪一种依赖的provider，比如使用最基础
的 Provider 值已经改变了（通过热更新或debug可知），
但是不会更新UI；若使用 ChangeNotifierProvider更新
值的同时会同步更新UI。

```dart
import 'package:flutter/material.dart';
import 'package:mfa/main.dart';
import 'package:mfa/widgets/basic/AppBar.dart';
import 'package:mfa/widgets/basic/Button.dart';
import 'package:provider/provider.dart';

class ProvidePage extends StatelessWidget {
  const ProvidePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final counter = Provider.of<CountNotifier>(context);
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: const BasicAppBar(title: '状态管理'),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              counter.count.toString(),
              style: TextStyle(fontSize: 40, color: colorScheme.primary),
            ),
            Button(
              'Provider.of',
              onPressed: () {
                counter.increment();
              },
            ),
            // Consumer 有个 Widget? child，它非常重要，能够在复杂项目中，极大地缩小你的控件刷新范围。
            Consumer(
              builder: (BuildContext context, Person person, Widget? child) {
                return Column(
                  children: [
                    Text(
                      "${person.age}",
                      style:
                          TextStyle(fontSize: 40, color: colorScheme.primary),
                    ),
                    Button(
                      'Consumer',
                      onPressed: () => person.changAge(),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
    ;
  }
}

```

```dart
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:mfa/constants/Color.dart';
import 'package:mfa/routes/routes.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding); // 保持屏幕海报
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  final ThemeMode themeMode = ThemeMode.system;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<CountNotifier>(
          create: (ctx) => CountNotifier(),
        ),
        ChangeNotifierProvider<Person>(
          create: (ctx) => Person(),
        )
      ],
      child: MaterialApp(
        title: 'MFA二次验证码',
        debugShowCheckedModeBanner: false,
        darkTheme: AppThemes.darkTheme,
        theme: AppThemes.lightTheme,
        themeMode: ThemeMode.system,
        // 主题模式
        routes: routes,
      ),
    );
  }
}

class CountNotifier extends ChangeNotifier {
  int count = 0;

  void increment() {
    count++;
    notifyListeners();
  }
}

class Person with ChangeNotifier {
  int age = 1;

  void changAge() {
    age += 1;
    notifyListeners();
  }
}

```
