```dart
import 'package:flutter/material.dart';

/// 用Builder把context暴露出来，以便Scaffold.of(context)可以使用
///  context会向上查找最近的Scaffold widget

Builder buildContainer(String name) {
  return Builder(
    builder: (context) => IconButton(
      onPressed: () {
        /// 这是一种查找方法
        /// Container? container = context.findAncestorWidgetOfExactType<Container>();
        /// print(container?.padding);
        /// print(name);
        Scaffold.of(context).closeDrawer();
      },
      icon: const Icon(Icons.menu_outlined),
    ),
  );
}

```
