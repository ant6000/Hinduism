import 'package:flutter/material.dart';
class TodayCard extends StatelessWidget {
  const TodayCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.blue,
          borderRadius: BorderRadius.all(Radius.circular(20))
      ),
      child: const Center(child:  Text('Bn: 12 Shrabon, 1430 EN: 14 July, 2024',style: TextStyle(
        fontSize: 16))),
    );
  }
}
