import 'package:feluda_story_books/src/presentation/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:provider/provider.dart';

import '../../provider/pdf_provider.dart';

class PdfViewScreen extends StatelessWidget {
  const PdfViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final pdfProvider = context.watch<PDFProvider>();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(hasBack: true, title: pdfProvider.name,),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: PDFView(
          filePath: pdfProvider.pdfPath,
          autoSpacing: true,
          enableSwipe: true,
          pageSnap: true,
          swipeHorizontal: false,
          nightMode: false,
          pageFling: true,
          fitEachPage: true,
          fitPolicy: FitPolicy.BOTH,
        ),
      ),
    );
  }
}
