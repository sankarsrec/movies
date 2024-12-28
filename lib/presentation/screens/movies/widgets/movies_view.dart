import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/entities/movie_entity.dart';
import '../../../../utils/size_constants.dart';
import '../cubit/movies_cubit.dart';
import 'movie_card.dart';

class MoviesView extends StatelessWidget {
  MoviesView({
    super.key,
    this.allMovies = const [],
  });

  final List<MovieEntity> allMovies;
  final ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollNotification>(
      /// To load data from next page during scroll end
      onNotification: (notification) => _handleScrollNotification(
        context,
        notification,
      ),
      child: GridView.builder(
        controller: scrollController,
        padding: const EdgeInsets.all(
          Sizes.dimen_16,
        ),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: Sizes.dimen_16,
          mainAxisSpacing: Sizes.dimen_16,
        ),
        itemCount: allMovies.length,
        itemBuilder: (context, index) {
          return MovieCard(
            movieData: allMovies[index],
          );
        },
      ),
    );
  }

  bool _handleScrollNotification(
    BuildContext context,
    ScrollNotification notification,
  ) {
    if (notification is ScrollEndNotification) {
      if (scrollController.position.extentAfter == 0) {
        context.read<MoviesCubit>().getAllMovies(
              isLoadNextPage: true,
            );
      }
    }
    return false;
  }
}
