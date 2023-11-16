在 Flutter 中，`BuildContext` 对象代表了 widget 树中的一个位置。每个 widget 都有它自己的 `BuildContext`，这就意味着 `BuildContext` 实际上是 widget 树中的一个节点。
当你使用 `Scaffold.of(context)` 时，它会从这个 context 向上遍历 widget 树，直到找到最近的 `Scaffold`。然而，这个 `context` 是在 `Scaffold` 构建之前就已经存在的，所以它无法找到 `Scaffold`。
`Builder` widget 可以创建一个新的 `BuildContext`，这个 `BuildContext` 是在 `Builder` 之后构建的，所以它可以找到 `Scaffold`。
这就是为什么我们在使用 `Scaffold.of(context)` 时经常需要使用 `Builder`：它可以提供一个能找到 `Scaffold` 的 `BuildContext`。

如果不套一层Builder，Scaffold.of(context).closeDrawer();这个context是Widget build(BuildContext context)的context，向上查是查不到closeDrawer的
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
//
```
