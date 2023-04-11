import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:logger/logger.dart';

class Page2 extends StatelessWidget {
  const Page2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Logger().i(GoRouter.of(context).location);
    return Scaffold(
      appBar: AppBar(title: const Text('Page2')),
      backgroundColor: Colors.red.shade50,
      body: const Center(child: Text('Page2')),
    );
  }
}
