import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:from_hansware/pages/delete_wares.dart';
import 'package:from_hansware/pages/insert_wares.dart';
import 'package:from_hansware/pages/update_wares.dart';
import 'package:google_fonts/google_fonts.dart';

class AdminPage extends StatefulWidget {
  const AdminPage({super.key});

  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {

  var bgColorLight = const Color.fromARGB(255, 247, 244, 231);
  var bgColorLightFocused = const Color.fromARGB(249, 240, 223, 175);
  var bgColorDark = const Color.fromARGB(255, 49, 65, 60);

  final List<Widget> _navigationItems = [
    const Icon(Icons.update, color: Color.fromRGBO(243, 210, 109, 1),),
    const Icon(Icons.add, color: Color.fromRGBO(243, 210, 109, 1)),
    const Icon(Icons.delete, color: Color.fromRGBO(243, 210, 109, 1),),
  ];

  final List<Widget> _pages = [
    const UpdateWares(),
    const InsertWares(),
    const DeleteWares()
  ];

  final List<String> _titles = [
    'Update',
    'Insert',
    'Delete',
  ];

  // ignore: prefer_typing_uninitialized_variables
  var _currentPage;
  // ignore: prefer_typing_uninitialized_variables
  var _currentTitle;

  void logout(){
    
  }

  @override
  void initState() {
    super.initState();
    _currentPage = _pages.elementAt(1);
    _currentTitle = _titles.elementAt(1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_currentTitle, style: GoogleFonts.mulish(color: Colors.white, fontWeight: FontWeight.bold),),
        backgroundColor: const Color.fromARGB(255, 70, 102, 70),
        iconTheme: const IconThemeData(color: Colors.white),
        actions: <Widget>[Padding(
          padding: const EdgeInsets.only(right: 3.0),
          child: IconButton(onPressed: logout, tooltip: 'Log Out', icon: const Icon(Icons.logout)),
        )],
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
          _currentTitle = _titles.elementAt(index);
          setState(() {
            
          });
        },
      ),
    );
  }
}