import 'package:flutter/material.dart';

import '../constants.dart';

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isCollapsed = false;
    return Container(
      width: isCollapsed ? MediaQuery.of(context).size.width * 0.2: null,
      child: Drawer(
        child: Container(
          color: kRedThemeColor,
          child: Column(
            children: [
              buildHeader(isCollapsed),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildHeader(bool isCollapsed) => Row(children: [

  ],);
}
