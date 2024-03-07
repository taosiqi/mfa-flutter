import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:mfa/widgets/basic/app_bar.dart';
import 'package:mfa/widgets/basic/async_data_loader.dart';
import 'package:mfa/widgets/basic/button.dart';
import 'package:oktoast/oktoast.dart';

class CameraPage extends StatefulWidget {
  const CameraPage({super.key});

  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  late List<CameraDescription> cameras;
  late CameraController controller;

  Future<void> initCamera() async {
    cameras = await availableCameras();
    controller = CameraController(cameras[0], ResolutionPreset.max);
    await controller.initialize();
  }

  Future<void> takePicture() async {
    XFile file = await controller.takePicture();
    debugPrint('拍摄成功，照片保存在：${file.path}'); //在缓存目录，还要用其他插件保存到相册
    await ImageGallerySaver.saveFile(file.path);
    showToast('照片已保存到相册',
        textPadding: const EdgeInsets.fromLTRB(20, 10, 20, 10));
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppBar(title: 'Camera'),
      body: AsyncDataLoader(
          futures: [
            initCamera(),
          ],
          builder: (data) {
            return Center(
              child: Column(
                children: [
                  CameraPreview(controller),
                  Button(
                    '拍摄',
                    onPressed: takePicture,
                  )
                ],
              ),
            );
          }),
    );
  }
}
