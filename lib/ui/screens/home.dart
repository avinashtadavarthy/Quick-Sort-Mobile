import 'package:flutter/material.dart';
import 'package:quick_sort/ui/screens/tabs/dashboard.dart';
import 'package:quick_sort/ui/screens/tabs/experiences.dart';
import 'package:quick_sort/ui/screens/tabs/mocks.dart';
import 'package:quick_sort/ui/screens/tabs/more.dart';
import 'package:quick_sort/ui/utils/refs.dart';
import 'package:quick_sort/ui/widgets/mybottomnavbar.dart';
import 'package:quick_sort/ui/widgets/mybottomnavbaritem.dart';

class HomeScreen extends StatefulWidget {
  final List<MyBottomNavBarItem> barItems = [
    MyBottomNavBarItem(
        text: "Home", 
        iconData: Icons.home, 
        color: Colors.blueAccent.shade400
        ),
    MyBottomNavBarItem(
      text: "Mocks",
      iconData: Icons.insert_invitation,
      color: Shades.spaceBlue
    ),
    MyBottomNavBarItem(
      text: "Experiences",
      iconData: Icons.speaker_notes,
      color: Shades.midnightBlue
    ),
    MyBottomNavBarItem(
      text: "More",
      iconData: Icons.more_horiz,
      color: Shades.sapphireBlue
    ),
  ];

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedBarIndex = 0;
  final List<Widget> _screens = [
    Dashboard(),
    Mocks(),
    Experiences(),
    More()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedContainer(
        child: _screens[selectedBarIndex],
          duration: const Duration(milliseconds: 300),
          color: widget.barItems[selectedBarIndex].color),
      bottomNavigationBar: MyBottomNavBar(
          barItems: widget.barItems,
          animationDuration: Duration(milliseconds: 150),
          barStyle: BarStyle(),
          onBarTap: (index) {
            setState(() {
              selectedBarIndex = index;
            });
          }),
    );
  }
}
