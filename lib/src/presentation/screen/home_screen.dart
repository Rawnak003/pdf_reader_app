import 'dart:io';
import 'package:feluda_story_books/src/core/route/route_name.dart';
import 'package:feluda_story_books/src/provider/pdf_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import '../../res/resource_list.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/home_screen_widgets/display_card_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<String> loadPDF(String assetPath) async {
    final ByteData data = await rootBundle.load('assets/pdf/$assetPath');
    final Uint8List bytes = data.buffer.asUint8List();

    final tempDir = await getTemporaryDirectory();
    final file = File('${tempDir.path}/$assetPath');

    await file.writeAsBytes(bytes, flush: true);
    print(file.path);
    return file.path;
  }

  void openBook(String fileName) async {
    print("File Name: $fileName");
    String filePath = await loadPDF(fileName);
    await context.read<PDFProvider>().setName(fileName);
    await context.read<PDFProvider>().setPDFPath(filePath);
    Navigator.pushNamed(context, RouteName.pdfScreen);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple.shade100,
      appBar: CustomAppBar(hasBack: false, title: 'Stories',),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.w),
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 16.w,
              mainAxisSpacing: 8.w,
              childAspectRatio: 0.58.w,
            ),
            itemCount: ResourceList.storiesList.length,
            itemBuilder: (context, index) {
              return InkWell(
                child: DisplayCard(index: index),
                onTap: () => openBook(ResourceList.storiesList[index]),
              );
            },
          ),
        ),
      ),
    );
  }
}