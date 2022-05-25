import 'package:flutter/material.dart';

class CustomTabBar extends StatelessWidget {
  final TabController controller;
  final List<Widget> tabs;

  const CustomTabBar({Key? key, required this.controller, required this.tabs}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double tabBarScaling = screenWidth > 1400
        ? 0.4
        : screenWidth > 1100
            ? 0.6
            : 0.7;

    return Padding(
      padding: EdgeInsets.only(right: screenWidth * 0.05),
      child: Container(
        width: screenWidth * tabBarScaling,
        child: Theme(
          data: ThemeData(
            hoverColor: Colors.transparent,
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
          ),
          child: TabBar(
            indicatorColor: Colors.green,
            controller: controller,
            tabs: tabs,
          ),
        ),
      ),
    );
  }
}
