import 'package:flutter/material.dart';

class AsyncDataLoader extends StatelessWidget {
  final List<Future<dynamic>> futures;
  final Widget Function(List<dynamic> data) builder;

  const AsyncDataLoader(
      {super.key, required this.futures, required this.builder});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<dynamic>>(
      future: Future.wait(futures), // 等待多个Future完成
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // 数据正在加载中
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('${snapshot.error}'));
        } else if (snapshot.hasData) {
          return builder(snapshot.data!);
        } else {
          // 没有数据
          return const Center(child: Text('No data'));
        }
      },
    );
  }
}
