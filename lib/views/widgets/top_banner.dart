
import 'package:flutter/material.dart';
class TopBanner extends StatelessWidget {
  final String text;
  const TopBanner({required this.text, super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      decoration: const BoxDecoration(
        color: Colors.amber,
        borderRadius: BorderRadius.all(Radius.circular(20))
      ),
      child: Center(
        child: Text(text),
      ),
    );
  }
}
