import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class OAuthWebView extends StatefulWidget {
  @override
  _OAuthWebViewState createState() => _OAuthWebViewState();
}

class _OAuthWebViewState extends State<OAuthWebView> {
  InAppWebViewController? webViewController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('OAuth2 WebView'),
      ),
      body: InAppWebView(
        initialUrlRequest:
            URLRequest(url: Uri.parse('http://localhost:3000/auth/google/')),
        onWebViewCreated: (controller) {
          webViewController = controller;
        },
        onLoadStart: (controller, url) {
          // Listen for URL changes.
          if (url != null) {
            final urlString = url.toString(); // Convert the Uri to a string.
            print('URL: $urlString');
            if (urlString.contains('/dashboard?code=') &&
                urlString.contains('&scope=')) {
              // Extract and print the URL with code and scope parameters.
              print('Final URL: $urlString');
            }
          }
        },
      ),
    );
  }
}
