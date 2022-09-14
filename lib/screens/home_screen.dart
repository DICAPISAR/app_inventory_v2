import 'package:app_inventory/screens/menu_screen.dart';
import 'package:app_inventory/screens/screens.dart';
import 'package:app_inventory/themes/app_theme.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Index of Default Home Sreen
  int _index = 1;

  void changeScreen(int index) {
    _index = index;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      initialIndex: 1,
      child: Scaffold(
        body: Column(children: [_homeScreens.elementAt(_index)]),
        bottomNavigationBar: ConvexAppBar.badge(
          const <int, dynamic>{2: ''},
          style: AppTheme.tabStyle,
          items: <TabItem>[
            for (final entry in _pages.entries)
              TabItem(icon: entry.value, title: entry.key),
          ],
          backgroundColor: AppTheme.primary,
          onTap: (int i) => changeScreen(i),
        ),
      ),
    );
  }
}

const Map<String, IconData> _pages = <String, IconData>{
  'Buscar': Icons.search,
  'Inicio': Icons.home,
  'Usuario': Icons.account_circle_outlined
};

final Set<Widget> _homeScreens = <Widget>{
  const ExampleScreen(),
  const MenuScreen(),
  const ExampleScreen(),
};
