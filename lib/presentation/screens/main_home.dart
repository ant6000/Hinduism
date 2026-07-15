import 'package:flutter/material.dart';
import 'package:hinduism/presentation/screens/Home_page.dart';
import 'package:hinduism/presentation/screens/community_page.dart';
import 'package:hinduism/presentation/screens/notification_page.dart';
import 'package:hinduism/presentation/screens/settings_page.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Widget> pages = [
    const HomePage(),
    const NotificationPage(),
    const CommunityPage(),
    const SettingsPage()
  ];

  final List<String> appbarTitle=[
    'Home',
    'Notifications',
    'Community',
    'Settings'
  ];
  int selectedIndex = 0;

  void onPageChanged(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    //FeaturesServices.getFeatureList();
    return Scaffold(
      body: SafeArea(
        child: pages[selectedIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.grey,
          onTap: onPageChanged,
          currentIndex: selectedIndex,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.notification_add), label: 'Notification'),
            BottomNavigationBarItem(
                icon: Icon(Icons.people), label: 'Community'),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings), label: 'Settings'),
          ]),
    );
  }
}
