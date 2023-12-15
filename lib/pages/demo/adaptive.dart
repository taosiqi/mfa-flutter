import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mfa/widgets/basic/app_bar.dart';

class AdaptivePage extends StatefulWidget {
  const AdaptivePage({super.key});

  @override
  State<AdaptivePage> createState() => _AdaptivePageState();
}

class _AdaptivePageState extends State<AdaptivePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppBar(title: 'adaptive'),
      body: Center(
        child: Container(width: 150.w, height: 150.w, color: Colors.amber),
      ),
    );
  }
}
