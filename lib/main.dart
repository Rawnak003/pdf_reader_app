import 'package:feluda_story_books/src/core/provider/app_provider.dart';
import 'package:feluda_story_books/src/core/route/route_configs.dart';
import 'package:feluda_story_books/src/core/route/route_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  getTemporaryDirectory();
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: AppProviders.getProviders(),
      child: ScreenUtilInit(
        minTextAdapt: true,
        splitScreenMode: true,
        designSize: const Size(375, 812),
        child: MaterialApp(
          title: 'Feludar Goendagiri',
          theme: ThemeData(
            primarySwatch: Colors.deepPurple,
          ),
          debugShowCheckedModeBanner: false,
          initialRoute: RouteName.splash,
          routes: AppRoutes.routes,
        ),
      ),
    );
  }
}

