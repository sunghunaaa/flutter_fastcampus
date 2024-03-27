import 'package:flutter/material.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  late int index;

  @override
  void initState() {
    super.initState();
    index = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('화면 이동'),
      ),
      body: HomeBody(),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'user',
          ),
        ],
        currentIndex: index,
        onTap: (newIndex) => setState(() {
          index = newIndex;
        }),
      ),
    );
  }

  Widget HomeBody() {
    switch (index) {
      case 1:
        return Center(
          child: Icon(Icons.search, size: 100),
        );
      case 2:
        return Center(
          child: Icon(Icons.person, size: 100),
        );
      case 0:
      default:
        return Center(
          child: Icon(Icons.home, size: 100),
        );
    }
  }
}
