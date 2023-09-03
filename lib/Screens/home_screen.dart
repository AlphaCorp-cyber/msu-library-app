import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';


class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double progress = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: Column(
        children: [
          progress < 1.0
              ? LinearProgressIndicator(value: progress,color: const Color.fromRGBO(5, 89, 109, 1),)
              : Container(),
          Expanded(
            child: InAppWebView(
              initialUrlRequest: URLRequest(
                url: Uri.parse('https://msulibrary.000webhostapp.com/'),
              ),
              initialOptions: InAppWebViewGroupOptions(
                crossPlatform: InAppWebViewOptions(
                  javaScriptEnabled: true,
                ),
              ),
              onProgressChanged: (controller, newProgress) {
                setState(() {
                  progress = newProgress / 100;
                });
              },
              onWebViewCreated: (controller) {
              },
            ),
          ),
        ],
      ),
    );
  }
}