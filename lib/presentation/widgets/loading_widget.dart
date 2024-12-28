import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../utils/app_colors.dart';

class LoadingWidget extends StatelessWidget {
  final Widget child;

  const LoadingWidget({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.white,
      highlightColor: AppColors.mercury,
      direction: ShimmerDirection.ltr,
      child: child,
    );
  }
}
