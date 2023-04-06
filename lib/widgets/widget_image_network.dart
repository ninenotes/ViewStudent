// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:viewstudent/widgets/show_image.dart';

class WidgetImageNetwork extends StatelessWidget {
  const WidgetImageNetwork({
    Key? key,
    required this.urlImage,
  }) : super(key: key);

  final String urlImage;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(imageUrl: urlImage, placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
    errorWidget: (context, url, error) => const ShowImage(),
    
    );
  }
}
