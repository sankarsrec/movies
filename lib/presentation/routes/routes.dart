import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/dependency_injection/dependency_injection.dart';
import 'package:movies/domain/use_cases/local/local_use_case.dart';
import 'package:movies/domain/use_cases/movies/get_movies_use_case.dart';
import 'package:movies/presentation/screens/movies/cubit/movies_cubit.dart';

import '../../presentation/screens/movies/movies_screen.dart';
import '../screens/splash/splash_screen.dart';

class Routes {
  /// Route name constants
  static const String splashScreen = 'splash';
  static const String moviesScreen = 'movies';

  /// Route name to route widget class mapping
  static Route onGenerateRoute(RouteSettings routeSettings) {
    Widget screen = const SizedBox.shrink();
    String routeName = routeSettings.name ?? '';

    switch (routeName) {
      case splashScreen:
        screen = const SplashScreen();
        break;
      case moviesScreen:
        screen = BlocProvider(
          create: (context) => MoviesCubit(
            getMoviesUseCase: getItInstance<GetMoviesUseCase>(),
            localUseCase: getItInstance<LocalUseCase>(),
          ),
          child: const MoviesScreen(),
        );
        break;
      default:
        screen = const SplashScreen();
    }

    return MaterialPageRoute<bool?>(
      builder: (context) => screen,
      settings: RouteSettings(
        name: routeName,
      ),
    );
  }
}
