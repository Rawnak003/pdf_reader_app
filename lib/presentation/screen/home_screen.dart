import 'dart:io';
import 'package:feluda_story_books/presentation/screen/pdf_view_screen.dart';
import 'package:feluda_story_books/res/resource_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
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
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PdfViewScreen(pdfPath: filePath, name: fileName),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo.shade50,
      appBar: AppBar(
        backgroundColor: Colors.indigoAccent,
        title: const Text(
          'Stories',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 8,
              mainAxisSpacing: 5,
              childAspectRatio: 0.68
          ),
          itemCount: ResourceList.storiesList.length,
          itemBuilder: (context, index) {
            return InkWell(
              child: DisplayCard(index: index,),
              onTap: () => openBook(ResourceList.storiesList[index]),
            );
          },
        ),
      )
    );
  }
}

