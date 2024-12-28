import 'package:flutter/material.dart';

import 'presentation/routes/routes.dart';
import 'utils/app_colors.dart';

class MoviesApp extends StatelessWidget {
  const MoviesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      color: AppColors.primaryColor,
      themeMode: ThemeMode.light,
      initialRoute: Routes.splashScreen,
      onGenerateRoute: Routes.onGenerateRoute,
    );
  }
}
