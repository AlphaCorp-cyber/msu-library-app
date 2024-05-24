import 'package:flutter/material.dart';

class DocumentViewerPage extends StatelessWidget {
  final String filePath;

  DocumentViewerPage({required this.filePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Document Viewer'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => _openFile(filePath),
          child: Text('Open Document'),
        ),
      ),
    );
  }

  void _openFile(String filePath) {
    if (filePath.isNotEmpty) {
      if (filePath.toLowerCase().endsWith('.pdf')) {
        // Open PDF document
        _openPdf(filePath);
      } else if (filePath.toLowerCase().endsWith('.docx')) {
        // Open Word document
        _openWord(filePath);
      } else {
        // Unsupported file type
        print('Unsupported file type.');
      }
    }
  }

  void _openPdf(String filePath) {
    // Code to open PDF document
    print('Opening PDF document: $filePath');
  }

  void _openWord(String filePath) {
    // Code to open Word document
    print('Opening Word document: $filePath');
  }
}
