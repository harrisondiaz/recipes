import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:recipes/pages/ListPage.dart';
import 'package:recipes/pages/PlanPage.dart';

import 'HomePage.dart';
import 'SettingPage.dart';

class FeedPage extends StatefulWidget {


  const FeedPage({Key? key, }) : super(key: key);

  @override
  State<FeedPage> createState() => _HomePageState();
}

class _HomePageState extends State<FeedPage> {
  int index = 0;
  final screens = [
    HomePage(),
    ListPage(),
    PlanPage(),
    SettingPage(),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
        height: MediaQuery.of(context).size.height,
          child: Scaffold(
            body: screens[index],
            bottomNavigationBar: Container(
              color: Colors.black,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
                child: GNav(
                  onTabChange: (int index) {
                    setState(() {
                      this.index = index;
                    });
                  },
                  tabs: [
                    GButton(
                      icon: Icons.home,
                      text: 'Inicio',

                    ),
                    GButton(
                      icon: Icons.list,
                      text: 'Lista',
                    ),
                    GButton(
                      icon: Icons.calendar_today_rounded,
                      text: 'Plan',
                    ),
                    GButton(icon: Icons.settings, text: 'Ajustes'),

                  ],
                  gap: 8,
                  activeColor: Colors.lime,
                  iconSize: 24,
                  padding: EdgeInsets.all(16),
                  backgroundColor: Colors.black,
                  color: Colors.white,
                  tabBackgroundColor: Colors.grey.shade800,
                  selectedIndex: index,



                ),
              ),
            ),
          ),
      ),
    ),
    );
  }
}
