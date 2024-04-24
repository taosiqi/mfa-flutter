import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mfa/widgets/basic/app_bar.dart';

class CachedImagePage extends StatefulWidget {
  const CachedImagePage({super.key});

  @override
  State<CachedImagePage> createState() => _CachedImagePageState();
}

class _CachedImagePageState extends State<CachedImagePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppBar(title: 'cached image'),
      body: Center(
        child: Column(
          children: [
            CachedNetworkImage(
              imageUrl: "http://via.placeholder.com/350x150",
              progressIndicatorBuilder: (context, url, downloadProgress) =>
                  CircularProgressIndicator(value: downloadProgress.progress),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
            const SizedBox(
              height: 50,
            ),
            CachedNetworkImage(
              imageUrl: "http://via.placeholder.com/350x150",
              progressIndicatorBuilder: (context, url, downloadProgress) =>
                  CircularProgressIndicator(value: downloadProgress.progress),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ],
        ),
      ),
    );
  }
}
