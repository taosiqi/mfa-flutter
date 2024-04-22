import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:mfa/widgets/basic/app_bar.dart';
import 'package:mfa/widgets/basic/safe_scroll_view.dart';

class LottiePage extends StatefulWidget {
  const LottiePage({super.key});

  @override
  State<LottiePage> createState() => _LottiePageState();
}

class _LottiePageState extends State<LottiePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppBar(title: 'lottie'),
      body: SafeScrollView(
        child: Column(
          children: [
            Lottie.asset('assets/lottie/LottieLogo.json'),
            Lottie.asset('assets/lottie/angel.zip'),
          ],
        ),
      ),
    );
  }
}
