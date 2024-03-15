import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';
import 'package:mfa/widgets/basic/app_bar.dart';
import 'package:mfa/widgets/basic/button.dart';

class DialogPage extends StatelessWidget {
  const DialogPage({super.key});

  // 原始弹窗
  Future<int?> showListDialog(BuildContext context) async {
    final theme = Theme.of(context).colorScheme;

    return await showDialog<int>(
      context: context,
      builder: (BuildContext context) {
        var child = Column(
          children: <Widget>[
            const ListTile(title: Text("请选择")),
            Expanded(
                child: ListView.builder(
              itemCount: 30,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text("$index"),
                  onTap: () => Navigator.of(context).pop(index),
                );
              },
            )),
          ],
        );
        return Dialog(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(5))),
          backgroundColor: theme.primary,
          child: child,
        );
      },
    );
  }

  // 自定义弹窗
  Future<int?> showListDialog2(BuildContext context) async {
    final theme = Theme.of(context).colorScheme;

    return await showDialog<int>(
      context: context,
      builder: (BuildContext context) {
        var child = Column(
          children: <Widget>[
            const ListTile(title: Text("请选择")),
            Expanded(
                child: ListView.builder(
              itemCount: 30,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text("$index"),
                  onTap: () => Navigator.of(context).pop(index),
                );
              },
            )),
          ],
        );
        // Dialog只是库提供的默认widget,showDialog才是根本，
        // 提供给showDialog的builder，完全阔以用其他代替，方便自定义
        // UnconstrainedBox是用来解除组件的约束尺寸的，showDialog有默认尺寸约束
        return UnconstrainedBox(
          constrainedAxis: Axis.vertical,
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 280),
            child: Material(
              type: MaterialType.card,
              child: child,
            ),
          ),
        );
      },
    );
  }

  //普通取消确认弹窗
  Future<bool?> showDeleteConfirmDialog(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("提示"),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(5))),
          backgroundColor: theme.primary,
          titleTextStyle: TextStyle(color: theme.onPrimary),
          contentTextStyle: TextStyle(color: theme.onPrimary),
          content: const Text("您确定要删除当前文件吗?"),
          actions: <Widget>[
            TextButton(
              child: Text(
                "取消",
                style: TextStyle(color: theme.onPrimary),
              ),
              onPressed: () => Navigator.of(context).pop(), // 关闭对话框
            ),
            TextButton(
              child: Text(
                "删除",
                style: TextStyle(color: theme.error),
              ),
              onPressed: () {
                //关闭对话框并返回true
                Navigator.of(context).pop(true);
              },
            ),
          ],
        );
      },
    );
  }

  // 列表弹窗
  Future<int?> openSimpleDialog(BuildContext context) async {
    final theme = Theme.of(context).colorScheme;
    return await showDialog<int>(
        context: context,
        builder: (BuildContext context) {
          //列表弹窗
          return SimpleDialog(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(5))),
            backgroundColor: theme.primary,
            titleTextStyle: TextStyle(color: theme.onPrimary),
            title: const Text('请选择数据'),
            children: <Widget>[
              SimpleDialogOption(
                onPressed: () {
                  // 返回1
                  Navigator.pop(context, 1);
                },
                child: Text(
                  '第一个',
                  style: TextStyle(color: theme.onPrimary),
                ),
              ),
              SimpleDialogOption(
                onPressed: () {
                  // 返回2
                  Navigator.pop(context, 2);
                },
                child: Text(
                  '第二个',
                  style: TextStyle(color: theme.onPrimary),
                ),
              ),
            ],
          );
        });
  }

  // 弹出底部菜单列表模态对话框
  Future<int?> bottomDialog(BuildContext context) {
    final theme = Theme.of(context).colorScheme;

    return showModalBottomSheet<int>(
      context: context,
      backgroundColor: theme.primary,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(12))),
      builder: (BuildContext context) {
        return ListView.builder(
          itemCount: 30,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text(
                "$index",
                style: TextStyle(color: theme.onPrimary),
              ),
              onTap: () => Navigator.of(context).pop(index),
            );
          },
        );
      },
    );
  }

  // Loading弹窗
  Future loadingDialog(BuildContext context) {
    final theme = Theme.of(context).colorScheme;

    return showDialog(
      context: context,
      barrierDismissible: true, //点击遮罩关闭对话框
      // barrierColor: theme.primary, //折罩颜色
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.transparent,
          surfaceTintColor: Colors.transparent, //背景色后面还有一个颜色
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              CircularProgressIndicator(
                color: theme.primary,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 26.0),
                child: Text(
                  "正在加载，请稍后...",
                  style: TextStyle(color: theme.onPrimary),
                ),
              )
            ],
          ),
        );
      },
    );
  }

  // 日历弹窗选择器
  Future<DateTime?> openDatePicker(BuildContext context) {
    var date = DateTime.now();
    return showDatePicker(
      context: context,
      initialDate: date,
      firstDate: date,
      // 可以通过builder定义样式
      builder: (context, child) {
        return Theme(
          data: ThemeData.dark(),
          child: child!,
        );
      },
      // initialDatePickerMode: DatePickerMode.year, //切换 年 日选择
      // initialEntryMode: DatePickerEntryMode.calendarOnly, //可以切换风格
      lastDate: date.add(
        //未来30天可选
        const Duration(days: 30),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppBar(title: '系统自带弹窗'),
      body: Center(
          child: Column(
        children: [
          Button(
            'Dialog',
            onPressed: () async {
              //弹出对话框并等待其关闭
              int? i = await showListDialog(context);
              if (i != null) {
                debugPrint("选择了第 $i 个");
              }
            },
          ),
          Button(
            'Custom Dialog',
            onPressed: () async {
              //弹出对话框并等待其关闭
              int? i = await showListDialog2(context);
              if (i != null) {
                debugPrint("选择了第 $i 个");
              }
            },
          ),
          Button(
            'AlertDialog',
            onPressed: () async {
              //弹出对话框并等待其关闭
              bool? delete = await showDeleteConfirmDialog(context);
            },
          ),
          Button(
            'SimpleDialog',
            onPressed: () async {
              //弹出对话框并等待其关闭
              int? i = await openSimpleDialog(context);
              if (i != null) {
                debugPrint("选择了第 $i 个");
              }
            },
          ),
          Button(
            'bottomDialog',
            onPressed: () async {
              //弹出对话框并等待其关闭
              int? i = await bottomDialog(context);
              if (i != null) {
                debugPrint("选择了第 $i 个");
              }
            },
          ),
          Button(
            'loadingDialog',
            onPressed: () async {
              //弹出对话框并等待其关闭
              await loadingDialog(context);
            },
          ),
          Button(
            'dateDialog',
            onPressed: () async {
              //弹出对话框并等待其关闭
              await openDatePicker(context);
            },
          ),
          Button(
            '第三方库',
            onPressed: () {
              DatePicker.showDatePicker(context,
                  showTitleActions: true,
                  minTime: DateTime(2018, 3, 5),
                  maxTime: DateTime(2019, 6, 7), onChanged: (date) {
                debugPrint('change $date');
              }, onConfirm: (date) {
                debugPrint('confirm $date');
              }, currentTime: DateTime.now(), locale: LocaleType.zh);
            },
          )
        ],
      )),
    );
  }
}
