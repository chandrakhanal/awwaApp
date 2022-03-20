import 'dart:async';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
//import 'package:flutter_webview_pro/webview_flutter.dart';

class AwwaWebPage extends StatefulWidget {
  const AwwaWebPage({Key? key, required this.title, required this.url});

  final String title;
  final String url;
  @override
  _AwwaWebPageState createState() => _AwwaWebPageState();
}

class _AwwaWebPageState extends State<AwwaWebPage> {
  int position = 1;
  bool loading = true;
  late WebViewController _controller;
  final Completer<WebViewController> _controllerCompleter =
      Completer<WebViewController>();
  late WebViewController _webViewController;
  //Make sure this function return Future<bool> otherwise you will get an error

  Future<bool> _onWillPop(BuildContext context) async {
    Navigator.of(context).pop();
    if (await _controller.canGoBack()) {
      _controller.goBack();
      return Future.value(false);
    } else {
      return Future.value(true);
    }
  }

  startSplashScreen() async {
    var duration = const Duration(seconds: 2);
    return Timer(
      duration,
      () {
        setState(() {
          loading = false;
        });
      },
    );
  }

  @override
  void initState() {
    super.initState();
    startSplashScreen();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => _onWillPop(context),
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          backgroundColor: Colors.pink[100],
          elevation: 10,
          actions: [
            Container(
              width: 48,
              child: Image.asset(
                'assets/images/AWWALogo.min.png',
              ),
            ),
            //Icon(Icons.more_vert),
            Text("    "),
          ],
        ),
        // body: loading == true
        //     ? Center(
        //         child: Image.asset(
        //           'assets/images/AWWALogo.min.png',
        //         ),
        //       )
        body: IndexedStack(index: position, children: <Widget>[
          WebView(
            // : SafeArea(
            //     child: WebView(
            //       key: UniqueKey(),
            initialUrl: widget.url,
            javascriptMode: JavascriptMode.unrestricted,
            onWebViewCreated: (WebViewController webViewController) {
              _webViewController = webViewController;
              _controllerCompleter.complete(webViewController);
            },
            onPageStarted: (value) {
              setState(() {
                position = 1;
              });
            },
            onPageFinished: (String url) {
              //print('Page finished loading: $url');

              _webViewController
                  .runJavascriptReturningResult("javascript:(function() { " +
                      "var head = document.getElementsByTagName('header')[0];" +
                      "head.parentNode.removeChild(head);" +
                      "var foot = document.getElementsByTagName('footer')[0];" +
                      "foot.parentNode.removeChild(foot);" +
                      "var breadc = document.getElementsByClassName('breadcrumb')[0];" +
                      "breadc.parentNode.removeChild(breadc);" +
                      "var langB = document.getElementsByClassName('lang-bar')[0];" +
                      "langB.parentNode.removeChild(langB);" +
                      "var IconB = document.getElementsByClassName('icon-bar')[0];" +
                      "IconB.parentNode.removeChild(IconB);" +
                      "var HomeIco = document.getElementsByClassName('floathome')[0];" +
                      "HomeIco.parentNode.removeChild(HomeIco);" +
                      // "const breadcrumb = document.getElementsByClassName('breadcrumb');" +
                      // "while(breadcrumb.length >= 0)breadcrumb[0].parentNode.removeChild(breadcrumb[0]);" +
                      // "const footer = document.getElementsByTagName('footer');" +
                      // "while(footer.length >= 0)footer[0].parentNode.removeChild(footer[0]);" +
                      "})()")
                  .then(
                      (value) => debugPrint('Page finished loading Javascript'))
                  .catchError((onError) => debugPrint('$onError'));
              setState(() {
                position = 0;
              });
            },
            gestureNavigationEnabled: true,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Image.asset(
                  'assets/images/AWWALogo.min.png',
                ),
              ),
              Center(
                  child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.pink.shade100),
              )),
            ],
          ),
          //Here
        ]),
      ),
    );
  }
}
