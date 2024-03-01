import 'dart:async';

import 'package:flutter/material.dart';
import 'package:to_do_app/screens/tab/profile/profile_screen.dart';

import 'calendar/calendar_screen.dart';
import 'home/home_screen.dart';

class TabBox extends StatefulWidget {
  const TabBox({super.key});

  @override
  State<TabBox> createState() => _TabBoxState();
}

class _TabBoxState extends State<TabBox> {
  StreamController<bool> streamController = StreamController<bool>();

  List<Widget> screens = [
    HomeScreen(stream: null,),
    CalendarScreen(),
    ProfileScreen(),
  ];

  int activeIndex = 0;

  _init() async {
    screens = [
      HomeScreen(stream: streamController.stream.asBroadcastStream()),
      CalendarScreen(),
      ProfileScreen(),
    ];
    setState(() {});
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[activeIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: activeIndex,
        onTap: (index) {
          setState(() {
            activeIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Jome",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month),
            label: "Calendar",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}
