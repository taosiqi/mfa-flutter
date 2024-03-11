import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mfa/utils/logger.dart';
import 'package:mfa/widgets/basic/app_bar.dart';
import 'package:mfa/widgets/basic/button.dart';

class ImagePickerPage extends StatefulWidget {
  const ImagePickerPage({super.key});

  @override
  State<ImagePickerPage> createState() => _ImagePickerPageState();
}

class _ImagePickerPageState extends State<ImagePickerPage> {
  Future<void> getLostData() async {
    final ImagePicker picker = ImagePicker();
    final List<XFile> files = await picker.pickMultiImage();
    if (files.isEmpty) {
      return;
    }
    logger.w(files[0].path);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppBar(title: 'image picker'),
      body: Center(
        child: Column(
          children: [
            Button(
              '选择照片',
              onPressed: () async {
                getLostData();
              },
            )
          ],
        ),
      ),
    );
  }
}
