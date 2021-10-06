import 'package:flutter/material.dart';
import 'package:flutter_app/Home/Home_Page.dart';
import 'package:flutter_app/Product/Catalogue.dart';
import 'package:flutter_app/Product/ProductScreen.dart';
import 'package:flutter_app/Product/ProductScreentest.dart';
import 'package:flutter_app/Profile/ProfileScreen.dart';
import 'package:flutter_app/Search/Search.dart';
import 'package:flutter_app/Service/AddService.dart';

class Navigation_menu extends StatefulWidget {
  @override
  _Navigation_menuState createState() => _Navigation_menuState();
}

class _Navigation_menuState extends State<Navigation_menu> {
  int _selectedIndex = 0;
  List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    //ProductScreenTest(),
    ServiceScreen(),
    //Search(),
    ProfileScreen(),
  ];

  void _onItemTap(int index) {
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
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.store,
            ),
            label: 'Store',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
            ),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTap,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        selectedFontSize: 13.0,
        unselectedFontSize: 13.0,
      ),
    );
  }
}