import 'package:flutter/material.dart';
import 'package:go_router_examples/app_router.dart';

class Page4 extends StatelessWidget {
  const Page4({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Page4')),
      body: PageStorage(
        bucket: pageBucket,
        child: ListView.builder(
          key: const PageStorageKey('Page4'),
          itemBuilder: (context, index) => Text('Item $index'),
          itemCount: 100,
        ),
      ),
    );
  }
}
