import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/presentation/screens/movies/widgets/search_field.dart';

import '../../../../domain/entities/movie_entity.dart';
import '../../../../utils/app_constants.dart';
import '../../../../utils/size_constants.dart';
import '../cubit/movies_cubit.dart';
import 'movie_card.dart';

class MoviesView extends StatefulWidget {
  const MoviesView({
    super.key,
    this.allMovies = const [],
  });

  final List<MovieEntity> allMovies;

  @override
  State<MoviesView> createState() => _MoviesViewState();
}

class _MoviesViewState extends State<MoviesView> {
  final ScrollController scrollController = ScrollController();
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SearchField(
          controller: searchController,
          labelText: AppConstants.searchMovies,
          onChanged: (searchText) =>
              context.read<MoviesCubit>().searchMovies(searchText),
          onCanceled: () => context.read<MoviesCubit>().searchMovies(''),
        ),
        Expanded(
          child: NotificationListener<ScrollNotification>(
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
                crossAxisSpacing: Sizes.dimen_5,
                mainAxisSpacing: Sizes.dimen_5,
                childAspectRatio: 0.75,
              ),
              itemCount: widget.allMovies.length,
              itemBuilder: (context, index) {
                return MovieCard(
                  movieData: widget.allMovies[index],
                  isFavorite:
                      context.read<MoviesCubit>().state.favoriteMovies.contains(
                            widget.allMovies[index],
                          ),
                );
              },
            ),
          ),
        ),
      ],
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
