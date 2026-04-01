import 'package:flutter/material.dart';

class Screen extends StatelessWidget {
  final Color? backgroundColor;
  final PreferredSizeWidget? appBar;
  final bool extendBody;
  final bool resizeToAvoidBottomInset;
  final Widget? drawer;
  final Widget? body;
  final Widget? bottomNavigationBar;
  final Widget? floatingActionButton;

  const Screen(
      {super.key,
      this.appBar,
      this.body,
      this.extendBody = false,
      this.resizeToAvoidBottomInset = true,
      this.drawer,
      this.bottomNavigationBar,
      this.floatingActionButton,
      this.backgroundColor = Colors.white});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: extendBody,
      backgroundColor: backgroundColor,
      appBar: appBar,
      drawer: drawer,
      body: body,
      floatingActionButton: floatingActionButton,
      bottomNavigationBar: bottomNavigationBar,
    );
  }
}
