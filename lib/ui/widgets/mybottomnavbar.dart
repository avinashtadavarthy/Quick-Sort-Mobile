import 'package:flutter/material.dart';
import 'package:quick_sort/ui/widgets/mybottomnavbaritem.dart';

class MyBottomNavBar extends StatefulWidget {
  final List<MyBottomNavBarItem> barItems;
  final Duration animationDuration;
  final Function onBarTap;
  final BarStyle barStyle;

  MyBottomNavBar(
      {this.barItems,
      this.animationDuration = const Duration(milliseconds: 500),
      this.onBarTap,
      this.barStyle});

  @override
  _MyBottomNavBarState createState() => _MyBottomNavBarState();
}

class _MyBottomNavBarState extends State<MyBottomNavBar>
    with TickerProviderStateMixin {
  
  int selectedBarIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      elevation: 10,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 10, 16, 10),
          child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: _buildBarItems()),
        ));
  }

  List<Widget> _buildBarItems() {
    List<Widget> _barItems = List();
    for (int i = 0; i < widget.barItems.length; i++) {
      MyBottomNavBarItem item = widget.barItems[i];
      bool isSelected = selectedBarIndex == i;
      _barItems.add(InkWell(
        splashColor: Colors.transparent,
        onTap: () {
          setState(() {
            selectedBarIndex = i;
            widget.onBarTap(selectedBarIndex);
          });
        },
        child: AnimatedContainer(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          duration: widget.animationDuration,
          decoration: BoxDecoration(
              color: isSelected
                  ? item.color.withOpacity(0.15)
                  : Colors.transparent,
              borderRadius: BorderRadius.all(Radius.circular(30))),
          child: Row(
            children: <Widget>[
              Icon(
                item.iconData,
                color: isSelected ? item.color : Colors.black,
                size: widget.barStyle.iconSize,
              ),
              SizedBox(
                width: isSelected ? 10 : 0,
              ),
              AnimatedSize(
                vsync: this,
                duration: widget.animationDuration,
                curve: Curves.easeInOut,
                child: Text(
                  isSelected ? item.text : "",
                  style: TextStyle(
                      color: item.color,
                      fontSize: widget.barStyle.fontSize,
                      fontFamily: 'Montserrat',
                      fontWeight: widget.barStyle.fontWeight),
                ),
              )
            ],
          ),
        ),
      ));
    }

    return _barItems;
  }
}
