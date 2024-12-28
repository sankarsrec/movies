import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/domain/entities/movie_entity.dart';
import 'package:movies/utils/app_colors.dart';
import 'package:movies/utils/app_constants.dart';

import '../../widgets/empty_widget.dart';
import 'cubit/movies_cubit.dart';
import 'widgets/movies_view.dart';

class MoviesScreen extends StatelessWidget {
  const MoviesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          AppConstants.moviesApp,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: AppColors.white,
              ),
        ),
        backgroundColor: AppColors.primaryColor,
      ),
      backgroundColor: AppColors.primaryColor,
      body: BlocBuilder<MoviesCubit, MoviesState>(
        bloc: context.read<MoviesCubit>()..getAllMovies(),
        builder: (context, state) {
          List<MovieEntity> moviesToShow =
              state.isSearch ? state.searchedMovies : state.allMovies;

          if (state.isLoading) {
            return const Center(
              child: CupertinoActivityIndicator(),
            );
          } else {
            return moviesToShow.isEmpty && !state.isSearch
                ? EmptyWidget(
                    message: AppConstants.noData,
                  )
                : MoviesView(
                    allMovies: moviesToShow,
                  );
          }
        },
      ),
    );
  }
}
