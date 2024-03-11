import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mfa/widgets/basic/app_bar.dart';
import 'package:mfa/widgets/basic/button.dart';

class ImagePickerPage extends StatefulWidget {
  const ImagePickerPage({super.key});

  @override
  State<ImagePickerPage> createState() => _ImagePickerPageState();
}

class _ImagePickerPageState extends State<ImagePickerPage> {
  late List<XFile> _files = [];
  Future<void> getLostData() async {
    final ImagePicker picker = ImagePicker();
    final List<XFile> files = await picker.pickMultiImage();
    if (files.isEmpty) {
      return;
    }
    setState(() {
      _files = files;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppBar(title: 'image picker'),
      body: Center(
        child: Column(
          children: [
            ..._files.map((item) {
              return Text(item.name);
            }),
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
