import 'package:flutter/material.dart';
import 'package:hinduism/views/widgets/feature_card.dart';
import 'package:hinduism/views/widgets/today_card.dart';
import 'package:hinduism/views/widgets/top_banner.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  static List<String> features = [
    'হিন্দুধর্ম',
    'ধর্মগ্রন্থ',
    'দেব-দেবী',
    'উপাসনা',
    'নীতিশিক্ষা',
    'তীর্থস্থান',
    'ধর্মীয় গান',
    'ধর্মীয় ভিডিও',
    'ধর্মীয় গল্প'
  ];
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      children: [
        const SizedBox(height: 5),
        const TodayCard(),
        const SizedBox(height: 5),
        const Text('Today\'s & up coming events',style: TextStyle(fontSize: 20),),
        const SizedBox(height: 5),
        const TopBanner(text: 'data',),
        const SizedBox(height: 5),
        const Text('Today\'s & up coming events',style: TextStyle(fontSize: 20),),
        const SizedBox(height: 5),
        GridView.builder(
          itemCount: features.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 5,
            crossAxisSpacing: 5,
              childAspectRatio: 1.5
          ),
          itemBuilder: (context, index) {
            return FeatureCard(name: features[index]);
          },)
      ],
    );
  }
}
