import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class TopBanner extends StatelessWidget {
  final String text;
  const TopBanner({required this.text, super.key});
  static final WebViewController controller = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..loadRequest(
        Uri.parse('https://www.prokerala.com/calendar/bengalicalendar.html'))
    ..runJavaScriptReturningResult('document.querySelector("#calendar")')
    ..setNavigationDelegate(NavigationDelegate(
      onPageFinished: (url) {},
    ));
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      decoration: const BoxDecoration(
          color: Colors.amber,
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child: WebViewWidget(
        controller: controller,
      ),
    );
  }
}

