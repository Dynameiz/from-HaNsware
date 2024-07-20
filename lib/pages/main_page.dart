import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:from_hansware/pages/home_page.dart';
import 'package:from_hansware/pages/item_page.dart';
import 'package:from_hansware/pages/setting_page.dart';
import 'package:google_fonts/google_fonts.dart';

class MainPage extends StatefulWidget {
  final String username;
  const MainPage({super.key, required this.username});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  var bgColorLight = const Color.fromARGB(255, 247, 244, 231);
  var bgColorDark = const Color.fromARGB(255, 49, 65, 60);
  
  final List<Widget> _navigationItems = [
    const Icon(Icons.shopping_cart_outlined, color: Color.fromRGBO(243, 210, 109, 1),),
    const Icon(Icons.home_outlined, color: Color.fromRGBO(243, 210, 109, 1)),
    const Icon(Icons.settings_outlined, color: Color.fromRGBO(243, 210, 109, 1),),
  ];

  // ignore: prefer_typing_uninitialized_variables
  var _currentPage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HaNsware", style: GoogleFonts.mulish(color: Colors.white, fontWeight: FontWeight.bold),),
        backgroundColor: const Color.fromARGB(255, 70, 102, 70),
      ),
      body: Container(
        color: bgColorLight,
        child: _currentPage,
      ),
      bottomNavigationBar: CurvedNavigationBar(
        items: _navigationItems,
        color: const Color.fromARGB(255, 70, 102, 70),
        backgroundColor: bgColorLight,
        animationDuration: Durations.medium2,
        index: 1,
        onTap: (index){
          switch (index) {
            case 0:
              // Store Page
              // bgColor = Colors.red;
              _currentPage = const ItemPage();
              break;
            case 1:
              // Home Page
              // bgColor = Colors.blue;
              _currentPage = const HomePage();
              break;
            case 2:
              // Setting
              // bgColor = Colors.yellow;
              _currentPage = const SettingPage();
              break;
          }
          setState(() {
            
          });
        },
      ),
    );
  }
}