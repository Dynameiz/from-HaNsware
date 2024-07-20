import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:from_hansware/pages/about_page.dart';
import 'package:from_hansware/pages/home_page.dart';
import 'package:from_hansware/pages/item_page.dart';
import 'package:from_hansware/pages/login_page.dart';
import 'package:from_hansware/pages/setting_page.dart';
import 'package:google_fonts/google_fonts.dart';

class MainPage extends StatefulWidget {
  final String username;
  const MainPage({super.key, required this.username});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  bool _theme = false;

  var bgColorLight = const Color.fromARGB(255, 247, 244, 231);
  var bgColorLightFocused = const Color.fromARGB(249, 240, 223, 175);
  var bgColorDark = const Color.fromARGB(255, 49, 65, 60);
  
  final List<Widget> _navigationItems = [
    const Icon(Icons.shopping_cart_outlined, color: Color.fromRGBO(243, 210, 109, 1),),
    const Icon(Icons.home_outlined, color: Color.fromRGBO(243, 210, 109, 1)),
    const Icon(Icons.settings_outlined, color: Color.fromRGBO(243, 210, 109, 1),),
  ];

  final List<Widget> _pages = [
    const ItemPage(),
    const HomePage(),
    const SettingPage(),
  ];

  // ignore: prefer_typing_uninitialized_variables
  var _currentPage;

  @override
  void initState() {
    super.initState();
    _currentPage = _pages.elementAt(1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HaNsware", style: GoogleFonts.mulish(color: Colors.white, fontWeight: FontWeight.bold),),
        backgroundColor: const Color.fromARGB(255, 70, 102, 70),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      drawer: Drawer(
        backgroundColor: bgColorLight,
        child: ListView(
          children: [
            SafeArea(
              child: DrawerHeader(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/SoE.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(241), color: Colors.white),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(241),
                        child: Image.asset("./assets/pfp.jpg", fit: BoxFit.cover, )
                      ),
                    ),
                    const SizedBox(height: 5.0,),
                    Text(widget.username, style: GoogleFonts.mulish(color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold, shadows: [const Shadow(color: Colors.black, blurRadius: 10.0, offset: Offset(2.0, 2.0))]),)
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10.0,),
            ListTile(
              leading: const Icon(Icons.person),
              title: Text("Profile", style: GoogleFonts.mulish(),),
            ),
            const SizedBox(height: 10.0,),
            ListTile(
              leading: const Icon(Icons.light_mode),
              title: Text("Theme", style: GoogleFonts.mulish(),),
              trailing: Switch(
                activeColor: Colors.green[900],
                value: _theme, 
                onChanged: (bool value){
                  setState(() {
                    _theme = value;
                  });
                },
              ),
            ),
            const SizedBox(height: 10.0,),
            
            ListTile(
              leading: const Icon(Icons.info_outline_rounded),
              title: Text("About", style: GoogleFonts.mulish(),),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context){
                    return const AboutPage();
                  },
                ));
              },
            ),

            const SizedBox(height: 10.0,),
            Divider(color: Colors.grey[500], indent: 10.0, endIndent: 10.0,),
            const SizedBox(height: 10.0,),

            ListTile(
              leading: const Icon(Icons.logout),
              title: Text("Log Out", style: GoogleFonts.mulish(),),
              onTap: (){
                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
                  builder: (context) {
                    return const LoginPage();
                  }
                ), (route) => false);
              },
            ),
          ],
        ),
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
          _currentPage = _pages.elementAt(index);
          setState(() {
            
          });
        },
      ),
    );
  }
}