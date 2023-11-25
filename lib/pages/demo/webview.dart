import 'package:flutter/material.dart';
import 'package:mfa/widgets/basic/AppBar.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebviewPage extends StatefulWidget {
  const WebviewPage({super.key});

  @override
  State<WebviewPage> createState() => _WebviewPageState();
}

class _WebviewPageState extends State<WebviewPage> {
  late final WebViewController controller;
  late String pageTitle = 'loading';

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            debugPrint(progress.toString()); //进度
            // Update loading bar.
          },
          onPageStarted: (String url) {
            debugPrint('开始$url'); //开始
          },
          onPageFinished: (url) {
            debugPrint('结束');
            setAppBarTitle();
          },
          onUrlChange: (change) {
            debugPrint(change.url);
          },
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            // 如果开头是这个域名，就暂停
            if (request.url.startsWith('https://mbd.baidu.com')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse('https://baidu.com'));
  }

  @override
  void dispose() {
    super.dispose();
    // controller = null;
  }

  Future<void> setAppBarTitle() async {
    var title = await controller.getTitle();
    setState(() {
      pageTitle = title ?? '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(title: pageTitle),
      body: WebViewWidget(controller: controller),
    );
  }
}
