import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_examples/app_router.dart';
import 'package:logger/logger.dart';

class BottomNavPage extends StatefulWidget {
  const BottomNavPage({Key? key, required this.child}) : super(key: key);
  final Widget child;

  @override
  State<BottomNavPage> createState() => _BottomNavPageState();
}

class _BottomNavPageState extends State<BottomNavPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.child,
      appBar: AppBar(
        title: const Text('BottomNavContainer'),
      ),
      bottomNavigationBar: NavigationBar(
        height: kBottomNavigationBarHeight + 8,
        selectedIndex: _calculateSelectedIndex(context),
        onDestinationSelected: (value) => _onItemTapped(value, context),
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_rounded),
            label: 'Page3',
          ),
          NavigationDestination(
            icon: Icon(Icons.supervised_user_circle),
            label: 'Page4',
          ),
          NavigationDestination(
            icon: Icon(Icons.settings),
            label: 'Page5',
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

  int _calculateSelectedIndex(BuildContext context) {
    final String location = GoRouterState.of(context).location;
    late int currentIndex;
    if (location.startsWith('/${AppRoutes.page3}')) {
      currentIndex = 0;
    } else if (location.startsWith('/${AppRoutes.page4}')) {
      currentIndex = 1;
    } else if (location.startsWith('/${AppRoutes.page5}')) {
      currentIndex = 2;
    } else {
      currentIndex = 0;
    }
    return currentIndex;
  }

  void _onItemTapped(int index, BuildContext context) {
    switch (index) {
      case 0:
        GoRouter.of(context).goNamed(AppRoutes.page3);
        break;
      case 1:
        GoRouter.of(context).goNamed(AppRoutes.page4);
        break;
      case 2:
        GoRouter.of(context).goNamed(AppRoutes.page5);
        break;
    }
  }
}
