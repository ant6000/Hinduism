import 'package:flutter/material.dart';
import 'package:hinduism/views/widgets/top_banner.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        TopBanner(
          text: 'notification',
        )
      ],
    );
  }
}
