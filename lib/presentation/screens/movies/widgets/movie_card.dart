import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/presentation/screens/movies/cubit/movies_cubit.dart';

import '../../../../domain/entities/movie_entity.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/size_constants.dart';
import '../../../widgets/movie_image.dart';

class MovieCard extends StatelessWidget {
  const MovieCard({
    super.key,
    required this.movieData,
    this.isFavorite = false,
  });

  final MovieEntity movieData;
  final bool isFavorite;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(
        Sizes.dimen_5,
      ),
      child: Column(
        children: [
          Expanded(
            flex: 3,
            child: MovieImage(
              imageUrl: movieData.image,
              name: movieData.name,
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              color: AppColors.grey,
              alignment: Alignment.center,
              padding: const EdgeInsets.all(
                Sizes.dimen_5,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      movieData.name,
                      style: Theme.of(context).textTheme.labelLarge?.copyWith(
                            color: AppColors.white,
                          ),
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  IconButton(
                    onPressed: () => _onClickFavorite(context),
                    icon: Icon(
                      isFavorite ? Icons.favorite : Icons.favorite_border,
                      color: AppColors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _onClickFavorite(BuildContext context) {
    context.read<MoviesCubit>().updateFavorite(
          movieData: movieData,
        );
  }
}
