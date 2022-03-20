import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

/*
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}*/

class AwwWebHome extends StatefulWidget {
  const AwwWebHome({Key? key, required this.title, required this.selectedUrl})
      : super(key: key);

  final String selectedUrl;
  final String title;

  @override
  _AwwWebHomeState createState() => _AwwWebHomeState();
}

class _AwwWebHomeState extends State<AwwWebHome> {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  late WebViewController _webViewController;

  //final String selectedUrl;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.pink,
      ),
      body: Builder(builder: (BuildContext context) {
        return WebView(
          initialUrl:
              "https://awwa.org.in/entrepreneur/register", //'https://flutter.dev',
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (WebViewController webViewController) {
            _webViewController = webViewController;
            _controller.complete(webViewController);
          },
          onProgress: (int progress) {
            print("WebView is loading (progress : $progress%)");
          },
          javascriptChannels: <JavascriptChannel>{
            _toasterJavascriptChannel(context),
          },
          navigationDelegate: (NavigationRequest request) {
            if (request.url.startsWith('https://www.youtube.com/')) {
              //print('blocking navigation to $request}');
              return NavigationDecision.prevent;
            }
            //print('allowing navigation to $request');
            return NavigationDecision.navigate;
          },
          onPageStarted: (String url) {
            //print('Page started loading: $url');
          },
          onPageFinished: (String url) {
            //print('Page finished loading: $url');
            _webViewController
                .evaluateJavascript("javascript:(function() { " +
                    "var head = document.getElementsByTagName('header')[0];" +
                    "head.parentNode.removeChild(head);" +
                    "var footer = document.getElementsByTagName('footer')[0];" +
                    "footer.parentNode.removeChild(footer);" +
                    "var langbar = document.getElementsByClassName('langbar');" +
                    "while(langbar.length > 0){langbar[0].parentNode.removeChild(langbar[0]);}" +
                    "var floathome = document.getElementsByClassName('floathome');" +
                    "while(floathome.length >= 0){floathome[0].parentNode.removeChild(floathome[0]);}" +
                    "var iconbar = document.getElementsByClassName('icon-bar');" +
                    "while(iconbar.length >= 0){iconbar[0].parentNode.removeChild(iconbar[0]);}" +
                    "})()")
                .then((value) => debugPrint('Page finished loading Javascript'))
                .catchError((onError) => debugPrint('$onError'));
          },
          gestureNavigationEnabled: true,
        );
      }),
    );
  }

  JavascriptChannel _toasterJavascriptChannel(BuildContext context) {
    return JavascriptChannel(
        name: 'Toaster',
        onMessageReceived: (JavascriptMessage message) {
          // ignore: deprecated_member_use
          Scaffold.of(context).showSnackBar(
            SnackBar(content: Text(message.message)),
          );
        });
  }
}
