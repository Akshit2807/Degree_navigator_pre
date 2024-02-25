import 'package:Degree_Navigator/constants/color.dart';
import 'package:Degree_Navigator/constants/icons.dart';
import 'package:Degree_Navigator/constants/size.dart';
import 'package:Degree_Navigator/screens/featuerd_screen.dart';
import 'package:flutter/material.dart';

class BaseScreen extends StatefulWidget {
  const BaseScreen({Key? key}) : super(key: key);

  @override
  _BaseScreenState createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    FeaturedScreen(),
    // FeaturedScreen(),
    // FeaturedScreen(),
    // FeaturedScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),

    );
  }
}
