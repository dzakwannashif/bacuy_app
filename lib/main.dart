import 'package:bacuy_app/ui/history.dart';
import 'package:bacuy_app/ui/home.dart';
import 'package:bacuy_app/ui/profile.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.orange),
      home: const BodyHome(),
    );
  }
}

class BodyHome extends StatefulWidget {
  const BodyHome({Key? key}) : super(key: key);

  @override
  State<BodyHome> createState() => _BodyHomeState();
}

class _BodyHomeState extends State<BodyHome> {
  int _selectedNavBar = 0;

  void _changeSelectedNavBar(int Index) {
    setState(() {
      _selectedNavBar = Index;
    });
  }

  final List<Widget> body = [
    Home(),
    History(),
    Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: body.elementAt(_selectedNavBar),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xFF08091B),
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.history), label: 'History'),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle_rounded), label: 'Profile'),
        ],
        showSelectedLabels: true,
        showUnselectedLabels: false,
        selectedItemColor: Color(0xFFF88909),
        currentIndex: _selectedNavBar,
        unselectedItemColor: Colors.white,
        onTap: _changeSelectedNavBar,
      ),
    );
  }
}
