import 'package:flutter/material.dart';
import 'package:flutterproject/app_screens/lunch_screen.dart';
import 'package:flutterproject/app_screens/education_screen.dart';
import 'package:flutterproject/app_screens/education_menu.dart';

class CustBotNav extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => CustBotNavState();
}

class CustBotNavState extends State<CustBotNav> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home 1',
      style: optionStyle,
    ),
    LunchApp(),
    EducationMenu(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        landscapeLayout: BottomNavigationBarLandscapeLayout.spread,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: 'Home',
              backgroundColor: Colors.green),
          BottomNavigationBarItem(
              icon: Icon(Icons.fastfood_outlined),
              label: 'Lunch Menu',
              backgroundColor: Colors.blue),
          BottomNavigationBarItem(
              icon: Icon(Icons.school_outlined),
              label: 'Education',
              backgroundColor: Colors.red),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        onTap: _onItemTapped,
      ),
    );
  }
}
