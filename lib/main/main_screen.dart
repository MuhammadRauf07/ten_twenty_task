import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {


  int _selectedIndex = 0;
  final List<Widget> _tabs = [
    const Text('Home'),
    const Text('Search'),
    const Text('Favorites'),
    const Text('Settings'),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _tabs.elementAt(_selectedIndex),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              icon: const Icon(Icons.home),
              onPressed: () => _onItemTapped(0),
              color: _selectedIndex == 0 ? Colors.blue : Colors.grey,
            ),
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () => _onItemTapped(1),
              color: _selectedIndex == 1 ? Colors.blue : Colors.grey,
            ),
            IconButton(
              icon: const Icon(Icons.favorite),
              onPressed: () => _onItemTapped(2),
              color: _selectedIndex == 2 ? Colors.blue : Colors.grey,
            ),
            IconButton(
              icon: const Icon(Icons.settings),
              onPressed: () => _onItemTapped(3),
              color: _selectedIndex == 2 ? Colors.blue : Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}
