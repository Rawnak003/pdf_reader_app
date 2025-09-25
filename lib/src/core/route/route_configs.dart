import 'package:feluda_story_books/src/presentation/screen/home_screen.dart';
import 'package:feluda_story_books/src/presentation/screen/pdf_view_screen.dart';
import 'package:flutter/material.dart';

import '../../presentation/screen/splash_screen.dart';
import 'route_name.dart';

class AppRoutes {
  static Map<String, WidgetBuilder> routes = {
    RouteName.splash: (context) => const SplashScreen(),
    RouteName.home: (context) => const HomeScreen(),
    RouteName.pdfScreen: (context) => const PdfViewScreen(),
  };
}