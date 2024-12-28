import 'package:flutter/material.dart';

import '../../../utils/app_colors.dart';
import '../../../utils/app_constants.dart';
import '../../routes/routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: AppConstants.splashDuration),
      () {
        if (mounted) {
          _openMoviesScreen(context);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Center(
        child: Text(
          AppConstants.moviesApp,
          style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                color: AppColors.white,
              ),
        ),
      ),
    );
  }

  void _openMoviesScreen(BuildContext context) {
    Navigator.pushReplacementNamed(
      context,
      Routes.moviesScreen,
    );
  }
}
