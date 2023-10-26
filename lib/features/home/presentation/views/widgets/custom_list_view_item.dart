import 'package:bookly_app/core/utils/assets_path.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CustomBookImage extends StatelessWidget {
  const CustomBookImage({Key? key, required this.imageUrl}) : super(key: key);

  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: AspectRatio(
        aspectRatio: 2.7/4,
        // child: Container(
        //   decoration: BoxDecoration(
        //     borderRadius: BorderRadius.circular(16),
        //     color: Colors.red,
        //     image: const DecorationImage(
        //       image: AssetImage(AssetsPath.testImage),
        //       fit:BoxFit.fill ,
        //     ),
        //   ),
        // ),
        child: CachedNetworkImage(
          fit: BoxFit.contain,
          imageUrl: imageUrl,
          placeholder: (context, url) => const CircularProgressIndicator(),
          errorWidget: (context, url, error) => const Icon(Icons.error),
        ),
      ),
    );
  }
}
