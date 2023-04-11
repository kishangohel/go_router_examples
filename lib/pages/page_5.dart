import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_examples/app_router.dart';
import 'package:logger/logger.dart';

class Page5 extends StatelessWidget {
  const Page5({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Page5')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Page5'),
            FilledButton(
              onPressed: () {
                context.goNamed(
                  AppRoutes.page1,
                );
              },
              child: const Text(
                'Go to Page1 with Go',
              ),
            ),
            FilledButton(
              onPressed: () {
                context.pushNamed(
                  AppRoutes.page1,
                );
              },
              child: const Text(
                'Go to Page1 with Push',
              ),
            ),
            FilledButton.tonal(
              onPressed: () {
                context.pushNamed(
                  AppRoutes.page2,
                  params: {
                    'type': TransitionType.rToL.name,
                  },
                );
              },
              child: const Text(
                'Go to Nested Page2 with Push',
              ),
            ),
            FilledButton.tonal(
              onPressed: () {
                context.goNamed(
                  AppRoutes.page2,
                  params: {
                    'type': TransitionType.rToL.name,
                  },
                );
              },
              child: const Text('Go to Page2 with Go'),
            ),
            FilledButton.tonal(
              onPressed: () {
                Logger().d(rootNavigatorKey.currentState?.context);
                Logger().d(bottomNavigatorKey.currentState?.context);
                context.pushNamed(
                  AppRoutes.rootPage2,
                );
              },
              child: const Text('Go to Root Page2 with Push'),
            ),
          ],
        ),
      ),
    );
  }
}
