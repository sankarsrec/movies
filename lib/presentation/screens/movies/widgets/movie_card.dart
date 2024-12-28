import 'package:flutter/material.dart';

import '../../../../domain/entities/movie_entity.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/size_constants.dart';
import '../../../widgets/movie_image.dart';

class MovieCard extends StatelessWidget {
  const MovieCard({
    super.key,
    required this.movieData,
  });

  final MovieEntity? movieData;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(
        Sizes.dimen_20,
      ),
      child: Column(
        children: [
          Expanded(
            flex: 3,
            child: MovieImage(
              imageUrl: movieData?.image ?? '',
              name: movieData?.name ?? '',
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              color: Theme.of(context).primaryColor,
              alignment: Alignment.center,
              padding: const EdgeInsets.all(
                Sizes.dimen_5,
              ),
              child: Text(
                movieData?.name ?? '',
                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      color: AppColors.white,
                    ),
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
