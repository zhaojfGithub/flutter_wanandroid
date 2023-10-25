import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebPage extends StatefulWidget {
  final String title;
  final String url;

  const WebPage({super.key, required this.title, required this.url});

  @override
  State<StatefulWidget> createState() {
    return WebPageState();
  }
}

class WebPageState extends State<WebPage> {

  double progress = 0;

  final WebViewController controller = WebViewController();

  @override
  void initState() {
    super.initState();
    controller.setJavaScriptMode(JavaScriptMode.unrestricted);
    controller.setBackgroundColor(const Color(0x00000000));
    controller.setNavigationDelegate(NavigationDelegate(
      onProgress: ((progress) {
        setState(() {
          this.progress = progress.toDouble() / 100;
        });
      }),
      onPageStarted: (url) {},
      onPageFinished: (url) {},
      onWebResourceError: (error) {},
      onNavigationRequest: (request) {
        return NavigationDecision.navigate;
      },
    ));
    controller.loadRequest(Uri.parse(widget.url));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title, maxLines: 1, overflow: TextOverflow.ellipsis),
          actions: [
            IconButton(
                icon: const Icon(
                  Icons.share,
                  color: Colors.white,
                ),
                onPressed: () {})
          ],
        ),
        body: Column(
          children: [
            if(progress != 1)
              LinearProgressIndicator(
                value: progress,
                minHeight: 1,
                backgroundColor: Colors.white,
                valueColor: AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor),
              ),
            Expanded(child: WebViewWidget(controller: controller))
          ],
        ),
      );
  }
}
