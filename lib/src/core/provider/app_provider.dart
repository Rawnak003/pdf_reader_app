import 'package:feluda_story_books/src/provider/pdf_provider.dart';
import 'package:feluda_story_books/src/provider/splash_provider.dart';
import 'package:provider/provider.dart';

class AppProviders {
  static List<ChangeNotifierProvider> getProviders() {
    return [
      ChangeNotifierProvider<SplashProvider>(
        create: (context) => SplashProvider(),
      ),
      ChangeNotifierProvider<PDFProvider>(
        create: (context) => PDFProvider(),
      ),
    ];
  }
}