import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:logger/logger.dart';

class DrawerPage1 extends StatelessWidget {
  const DrawerPage1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Logger().i(GoRouter.of(context).location);
    return Scaffold(
      // appBar: AppBar(title: const Text('DrawerPage1')),
      backgroundColor: Colors.red.shade50,
      body: const Center(child: Text('DrawerPage1')),
    );
  }
}
