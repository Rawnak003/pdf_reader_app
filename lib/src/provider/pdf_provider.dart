import 'package:flutter/material.dart';

class PDFProvider extends ChangeNotifier {

  String _pdfPath = '';
  String _name = '';

  String get pdfPath => _pdfPath;
  String get name => _name;

  Future<void> setPDFPath(String path) async {
    _pdfPath = path;
    notifyListeners();
  }

  Future<void> setName(String name) async {
    _name = name;
    notifyListeners();
  }

}