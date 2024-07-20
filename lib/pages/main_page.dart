import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:from_hansware/pages/home_page.dart';

class MainPage extends StatefulWidget {
  final String username;
  const MainPage({super.key, required this.username});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  final List<Widget> _navigationItems = [
    const Icon(Icons.shopping_cart_outlined),
    const Icon(Icons.home_outlined),
    const Icon(Icons.settings_outlined),
  ];

  final Widget _currentPage = const HomePage();
  var bgColor = const Color.fromARGB(255, 247, 244, 231);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("HaNsware"),
      ),
      body: Container(
        color: bgColor,
        child: _currentPage,
      ),
      bottomNavigationBar: CurvedNavigationBar(
        items: _navigationItems,
        color: const Color.fromARGB(255, 247, 244, 231),
        backgroundColor: bgColor,
        animationDuration: Durations.medium2,
        index: 1,
        onTap: (index){
          switch (index) {
            case 0:
              // Store Page
              bgColor = Colors.red;
              break;
            case 1:
              // Home Page
              bgColor = Colors.blue;
              break;
            case 2:
              // Setting
              bgColor = Colors.yellow;
              break;
          }
          setState(() {
            
          });
        },
      ),
    );
  }
}