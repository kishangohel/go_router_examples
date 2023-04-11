import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_examples/app_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home Page')),
      backgroundColor: Colors.grey.shade100,
      body: ListView(
        padding: const EdgeInsets.all(16),
        physics: const BouncingScrollPhysics(),
        children: [
          ElevatedButton(
            onPressed: () {
              context.goNamed(AppRoutes.page1);
            },
            child: const Text('Direct route : Page1'),
          ),
          ElevatedButton(
            onPressed: () {
              context.goNamed(
                AppRoutes.page2,
                params: {
                  'type': TransitionType.scale.name,
                },
              );
            },
            child: const Text('Direct route to :Page2'),
          ),
          ElevatedButton(
            onPressed: () {
              context.goNamed(AppRoutes.transitions);
            },
            child: const Text('Page Transition Examples'),
          ),
          ElevatedButton(
            onPressed: () {
              context.goNamed(AppRoutes.page3);
            },
            child: const Text('Bottom Navigation'),
          ),
          ElevatedButton(
            onPressed: () {
              context.goNamed(AppRoutes.drawerPage1);
            },
            child: const Text('Drawer Navigation'),
          ),
        ],
      ),
    );
  }
}
