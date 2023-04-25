import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_examples/app_router.dart';

class TransitionsPage extends StatelessWidget {
  const TransitionsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Transitions')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          ElevatedButton(
            onPressed: () {
              context.goNamed(
                AppRoutes.page2,
                params: {
                  'type': TransitionType.fade.name,
                },
              );
            },
            child: const Text('Fade Page Transition :Page2'),
          ),
          ElevatedButton(
            onPressed: () {
              context.goNamed(
                AppRoutes.page2,
                params: {
                  'type': TransitionType.rToL.name,
                },
              );
            },
            child: const Text('Right To Left Transition :Page2'),
          ),
          ElevatedButton(
            onPressed: () {
              context.goNamed(
                AppRoutes.page2,
                params: {
                  'type': TransitionType.lToR.name,
                },
              );
            },
            child: const Text('Left To Right Transition :Page2'),
          ),
          ElevatedButton(
            onPressed: () {
              context.goNamed(
                AppRoutes.page2,
                params: {
                  'type': TransitionType.bToT.name,
                },
              );
            },
            child: const Text('Bottom To Top Transition :Page2'),
          ),
          ElevatedButton(
            onPressed: () {
              context.goNamed(
                AppRoutes.page2,
                params: {
                  'type': TransitionType.tToB.name,
                },
              );
            },
            child: const Text('Top To Bottom Transition :Page2'),
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
            child: const Text('Scale Transition :Page2'),
          ),
          ElevatedButton(
            onPressed: () {
              context.goNamed(
                AppRoutes.page2,
                params: {
                  'type': TransitionType.mix.name,
                },
              );
            },
            child: const Text('Mix Transition :Page2'),
          ),
        ],
      ),
    );
  }
}
