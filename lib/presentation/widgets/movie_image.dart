import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';
import 'loading_widget.dart';

class MovieImage extends StatelessWidget {
  final String imageUrl;
  final String name;

  const MovieImage({
    super.key,
    required this.imageUrl,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      width: MediaQuery.of(context).size.width,
      placeholder: (BuildContext context, String imageUrl) {
        return LoadingWidget(
          child: Container(
            color: AppColors.mercury,
          ),
        );
      },
      errorWidget: (BuildContext context, String imageUrl, dynamic error) {
        return Container(
          alignment: Alignment.center,
          color: AppColors.white,
          child: Center(
            child: Text(
              name.substring(0, 1).toUpperCase(),
              style: Theme.of(context).textTheme.headlineLarge,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        );
      },
      fit: BoxFit.fill,
    );
  }
}
