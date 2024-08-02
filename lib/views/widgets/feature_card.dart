import 'package:flutter/material.dart';

class FeatureCard extends StatelessWidget {
final String name;
  const FeatureCard({required this.name, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:const BoxDecoration(
        color: Colors.amber,
        borderRadius: BorderRadius.all(Radius.circular(10))
      ),
      child: Center(child: Text(name,style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),)),
    );
  }
}
