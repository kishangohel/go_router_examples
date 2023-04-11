import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_examples/app_router.dart';
import 'package:logger/logger.dart';

class DrawerNavPage extends StatefulWidget {
  const DrawerNavPage({Key? key, required this.child}) : super(key: key);
  final Widget child;

  @override
  State<DrawerNavPage> createState() => _DrawerNavPageState();
}

class _DrawerNavPageState extends State<DrawerNavPage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: widget.child,
      appBar: AppBar(
        title: Text(title),
      ),
      drawer: NavigationDrawer(
        selectedIndex: _calculateSelectedIndex(context),
        onDestinationSelected: (value) => _onItemTapped(value, context),
        children: const [
          NavigationDrawerDestination(
            icon: Icon(Icons.home_rounded),
            label: Text('DrawerPage1'),
          ),
          NavigationDrawerDestination(
            icon: Icon(Icons.supervised_user_circle),
            label: Text('DrawerPage2'),
          ),
          NavigationDrawerDestination(
            icon: Icon(Icons.settings),
            label: Text('DrawerPage3'),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    Logger().d('Disposing...');
    super.dispose();
  }

  String get title {
    final String location = GoRouterState.of(context).location;
    late String title;
    if (location.startsWith('/${AppRoutes.drawerPage1}')) {
      title = 'DrawerPage1';
    } else if (location.startsWith('/${AppRoutes.drawerPage2}')) {
      title = 'DrawerPage2';
    } else if (location.startsWith('/${AppRoutes.drawerPage3}')) {
      title = 'DrawerPage3';
    } else {
      title = 'DrawerPage1';
    }
    return title;
  }

  int _calculateSelectedIndex(BuildContext context) {
    final String location = GoRouterState.of(context).location;
    late int currentIndex;
    if (location.startsWith('/${AppRoutes.drawerPage1}')) {
      currentIndex = 0;
    } else if (location.startsWith('/${AppRoutes.drawerPage2}')) {
      currentIndex = 1;
    } else if (location.startsWith('/${AppRoutes.drawerPage3}')) {
      currentIndex = 2;
    } else {
      currentIndex = 0;
    }
    return currentIndex;
  }

  void _onItemTapped(int index, BuildContext context) {
    switch (index) {
      case 0:
        GoRouter.of(context).goNamed(AppRoutes.drawerPage1);
        break;
      case 1:
        GoRouter.of(context).goNamed(AppRoutes.drawerPage2);
        break;
      case 2:
        GoRouter.of(context).goNamed(AppRoutes.drawerPage3);
        break;
    }
    Future.delayed(
      Duration.zero,
      scaffoldKey.currentState?.closeDrawer,
    );
  }
}
