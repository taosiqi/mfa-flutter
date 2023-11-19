import 'package:flutter/material.dart';
import 'package:mfa/widgets/basic/AppBar.dart';

class ListPage extends StatelessWidget {
  const ListPage({Key? key}) : super(key: key);

  // 上拉加载
  Future<void> _onRefresh() async {
    await Future.delayed(const Duration(seconds: 3), () {
      debugPrint('refresh');
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<String> items = List<String>.generate(100, (i) => 'Item $i');
    //下划线widget预定义以供复用。
    // Widget divider1 = const Divider(
    //   color: Colors.blue,
    // );
    // Widget divider2 = const Divider(color: Colors.green);
    return Scaffold(
        appBar: const BasicAppBar(title: '列表'),
        //ListView.separated比ListView.builder多了一个separatorBuilder
        // body: ListView.separated(
        //   itemCount: items.length, //项目数量
        //   itemBuilder: (BuildContext context, int index) {
        //     return ListTile(title: Text(items[index]));
        //   },
        //   separatorBuilder: (BuildContext context, int index) {
        //     return index % 2 == 0 ? divider1 : divider2;
        //   },
        // ));
        body: RefreshIndicator(
          onRefresh: _onRefresh,
          child: ListView.builder(
            itemCount: items.length, //项目数量
            itemExtent: 50.0, //定义高度  itemExtent 或 prototypeItem 互斥
            // prototypeItem: const ListTile( title: Text( '123')),
            // 当我们知道列表项的高度都相同时，强烈建议指定这两个参数之一
            itemBuilder: (BuildContext context, int index) {
              return _reader(index, items);
            },
          ),
        ));
  }

  StatelessWidget _reader(int index, List<String> items) {
    // https://juejin.cn/post/6992513095956430862 有事件监听判断是否触底
    if (index == 99) {
      return Container(
        padding: const EdgeInsets.all(10),
        alignment: Alignment.center,
        child: const SizedBox(
          width: 30.0,
          height: 30.0,
          child: CircularProgressIndicator(strokeWidth: 2.0),
        ),
      );
    } else {
      return ListTile(title: Text(items[index]));
    }
  }
}
