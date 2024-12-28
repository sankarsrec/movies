import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
      ),
      body: BlocBuilder<MoviesCubit, MoviesState>(
        bloc: context.read<MoviesCubit>()..getAllMovies(),
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(
              child: CupertinoActivityIndicator(),
            );
          } else {
            return state.allMovies.isEmpty
                ? EmptyWidget(
                    message: AppConstants.noData,
                  )
                : MoviesView(
                    allMovies: state.allMovies,
                  );
          }
        },
      ),
    );
  }
}
