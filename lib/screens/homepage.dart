import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:pb/responsive.dart';
import 'package:pb/screens/statistics.dart';
import 'package:pb/screens/tesstings.dart';
import 'package:pb/screens/training_db.dart';
import 'package:pb/widgets/NavigationDrawer.dart';

import '../constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int index = 1;
  final screens = const [Statistics(), Training_db()];
  final List<Map<String, Object>> map = [
    {'title': 'Stats', 'widget': MyHomePage()},
    {'title': 'DB', 'widget': const Training_db()},
  ];
  void changeIndex(int i) {
    setState(() {
      index = i;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(map[index]['title'] as String),
        backgroundColor: kRedThemeColor,
      ),
      drawer: !Responsive.isMobile(context) ? NavigationDrawer() : null,
      body: map[index]['widget'] as Widget,
      bottomNavigationBar: Responsive.isMobile(context)
          ? ConvexAppBar(
              backgroundColor: kRedThemeColor,
              style: TabStyle.reactCircle,
              items: const [
                TabItem(icon: Icons.stacked_line_chart, title: 'Stats'),
                TabItem(icon: Icons.view_list, title: 'DB'),
              ],
              initialActiveIndex: 1,
              onTap: (int i) {
                changeIndex(i);
              },
            )
          : null,
    );
  }
}
