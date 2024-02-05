import 'package:flutter/material.dart';
import 'package:ten_twenty_task/configs/helper/common.dart';
import 'package:ten_twenty_task/configs/helper/extensions.dart';
import 'package:ten_twenty_task/configs/helper/screen_util.dart';
import 'package:ten_twenty_task/configs/theme/app_theme.dart';
import 'package:ten_twenty_task/screens/tabs/watch/watch_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  MainScreenState createState() => MainScreenState();
}

class MainScreenState extends State<MainScreen> {
  int _selectedTab = 1;

  final List<Widget> _pages = [
    const Text("Coming Soon").centralized(),
    const WatchScreen(),
    const Text("Coming Soon").centralized(),
    const Text("Coming Soon").centralized(),
    const Text("Coming Soon").centralized(),
  ];

  void _changeTab(int index) {
    setState(() {
      _selectedTab = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(child: _pages[_selectedTab]),
          Container(
            decoration: BoxDecoration(
                color: AppTheme.cT!.appBlueColor,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(22.w),
                    topLeft: Radius.circular(22.w))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                bottomNavigationBar(Icons.home, "Home", 0),
                bottomNavigationBar(
                    Icons.play_circle_outline_sharp, "Watch", 1),
                bottomNavigationBar(Icons.settings, "Settings", 2),
                bottomNavigationBar(Icons.favorite, "Favorite", 3),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget bottomNavigationBar(IconData iconData, String text, int index) {
    final isSelected = _selectedTab == index;
    return GestureDetector(
      onTap: () => _changeTab(index),
      child: Container(
        width: MediaQuery.of(context).size.width / _pages.length,
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              iconData,
              color: isSelected ? Colors.white : AppTheme.cT!.greyColor,
            ),
            const SizedBox(height: 4),
            CommonWidgets().makeDynamicText(
              text: text,
              size: 16,
              weight: FontWeight.w400,
              color: isSelected ? Colors.white : AppTheme.cT!.greyColor,
            ),
          ],
        ),
      ),
    );
  }
}
