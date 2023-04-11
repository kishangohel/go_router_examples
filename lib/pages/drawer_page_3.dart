import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:logger/logger.dart';

class DrawerPage3 extends StatelessWidget {
  const DrawerPage3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Logger().i(GoRouter.of(context).location);
    return Scaffold(
      // appBar: AppBar(title: const Text('DrawerPage3')),
      backgroundColor: Colors.purple.shade50,
      body: const Center(child: Text('DrawerPage3')),
    );
  }
}
