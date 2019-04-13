import 'package:flutter/material.dart';

class NavigationIconView {

  final BottomNavigationBarItem item;
  final String title;
  final String iconPath;
  final String activeIconPath;

  NavigationIconView(
      {@required this.title,
        @required this.iconPath,
        @required this.activeIconPath})
      : item = BottomNavigationBarItem(
      icon: Image.asset(iconPath,
        width: 20.0,
        height: 20.0,
      ),
      activeIcon: Image.asset(activeIconPath,
        width: 20.0,
        height: 20.0,),
      title: Text(title));
}