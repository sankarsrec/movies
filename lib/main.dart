import 'package:flutter/material.dart';

import 'dependency_injection/dependency_injection.dart';
import 'movies_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DependencyInjection.initializeInjection();
  runApp(const MoviesApp());
}
