import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
class DetailScreen extends StatelessWidget {
  // Declare a field that holds the Todo
  final String url;
  // In the constructor, require a Todo
  const DetailScreen({Key? key, required this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Use the Todo to create our UI
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail'),
      ),
      body: WebView(
        initialUrl: url,
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
