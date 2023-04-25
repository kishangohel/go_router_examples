import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_examples/blocs/page3/page3_cubit.dart';
import 'package:go_router_examples/page_transitions/b_to_t_transition.dart';
import 'package:go_router_examples/page_transitions/fade_transition.dart';
import 'package:go_router_examples/page_transitions/l_to_r_transition.dart';
import 'package:go_router_examples/page_transitions/mix_transition.dart';
import 'package:go_router_examples/page_transitions/r_to_l_transition.dart';
import 'package:go_router_examples/page_transitions/scale_transition.dart';
import 'package:go_router_examples/page_transitions/t_to_b_transition.dart';
import 'package:go_router_examples/pages/drawer_page_1.dart';
import 'package:go_router_examples/pages/drawer_page_2.dart';
import 'package:go_router_examples/pages/drawer_page_3.dart';
import 'package:go_router_examples/pages/page_1.dart';
import 'package:go_router_examples/pages/page_2.dart';
import 'package:go_router_examples/pages/page_3.dart';
import 'package:go_router_examples/pages/page_4.dart';
import 'package:go_router_examples/pages/page_5.dart';
import 'package:go_router_examples/pages/page_bottom_nav.dart';
import 'package:go_router_examples/pages/page_drawer_nav.dart';
import 'package:go_router_examples/pages/page_home.dart';
import 'package:go_router_examples/pages/page_transitions.dart';
import 'package:logger/logger.dart';

part 'app_routes.dart';

enum TransitionType { none, fade, rToL, lToR, bToT, tToB, scale, mix }

final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');
final GlobalKey<NavigatorState> bottomNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'bottom');
final GlobalKey<NavigatorState> drawerNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'drawer');

final pageBucket = PageStorageBucket();

final appRouter = GoRouter(
  navigatorKey: rootNavigatorKey,
  debugLogDiagnostics: kDebugMode,
  // initialLocation: AppRoutes.home,
  errorBuilder: (context, state) => Scaffold(
    body: Center(
      child: Text('${state.error?.toString()}'),
    ),
  ),
  // observers: [GoRouterObserver()],
  routes: <RouteBase>[
    ShellRoute(
      navigatorKey: bottomNavigatorKey,
      pageBuilder: (context, state, child) => FadePageTransition(
        key: state.pageKey,
        child: BlocProvider(
          create: (context) => Page3Cubit(),
          child: BottomNavPage(child: child),
        ),
      ),
      routes: [
        GoRoute(
          // parentNavigatorKey: shellNavigatorKey,
          path: '/${AppRoutes.page3}',
          name: AppRoutes.page3,
          pageBuilder: (context, state) {
            Logger().d(state.pageKey);
            return ScalePageTransition(
              key: state.pageKey,
              child: const Page3(),
            );
          },
        ),
        GoRoute(
          // parentNavigatorKey: shellNavigatorKey,
          path: '/${AppRoutes.page4}',
          name: AppRoutes.page4,
          pageBuilder: (context, state) => ScalePageTransition(
            key: state.pageKey,
            child: const Page4(),
          ),
        ),
        GoRoute(
          // parentNavigatorKey: shellNavigatorKey,
          path: '/${AppRoutes.page5}',
          name: AppRoutes.page5,
          pageBuilder: (context, state) => ScalePageTransition(
            key: state.pageKey,
            child: const Page5(),
          ),
        ),
      ],
    ),
    ShellRoute(
      navigatorKey: drawerNavigatorKey,
      pageBuilder: (context, state, child) => FadePageTransition(
        key: state.pageKey,
        child: DrawerNavPage(child: child),
      ),
      routes: [
        GoRoute(
          // parentNavigatorKey: shellNavigatorKey,
          path: '/${AppRoutes.drawerPage1}',
          name: AppRoutes.drawerPage1,
          pageBuilder: (context, state) {
            Logger().d(state.pageKey);
            return ScalePageTransition(
              key: state.pageKey,
              child: const DrawerPage1(),
            );
          },
        ),
        GoRoute(
          // parentNavigatorKey: shellNavigatorKey,
          path: '/${AppRoutes.drawerPage2}',
          name: AppRoutes.drawerPage2,
          pageBuilder: (context, state) => ScalePageTransition(
            key: state.pageKey,
            child: const DrawerPage2(),
          ),
        ),
        GoRoute(
          // parentNavigatorKey: shellNavigatorKey,
          path: '/${AppRoutes.drawerPage3}',
          name: AppRoutes.drawerPage3,
          pageBuilder: (context, state) => ScalePageTransition(
            key: state.pageKey,
            child: const DrawerPage3(),
          ),
        ),
      ],
    ),
    GoRoute(
      parentNavigatorKey: rootNavigatorKey,
      path: '/',
      name: AppRoutes.home,
      pageBuilder: (context, state) => FadePageTransition(
        key: state.pageKey,
        child: const HomePage(),
      ),
      // sub-route path may not start or end with /
      routes: <RouteBase>[
        GoRoute(
          path: AppRoutes.transitions,
          name: AppRoutes.transitions,
          pageBuilder: (context, state) => FadePageTransition(
            key: state.pageKey,
            child: const TransitionsPage(),
          ),
          routes: <RouteBase>[
            GoRoute(
              path: '${AppRoutes.page2}/:type',
              name: AppRoutes.page2,
              pageBuilder: (context, state) {
                final typeString = state.params['type'];
                final type = TransitionType.values.firstWhere(
                  (element) => element.name == typeString,
                  orElse: () => TransitionType.none,
                );
                switch (type) {
                  case TransitionType.none:
                  case TransitionType.fade:
                    return FadePageTransition(
                      key: state.pageKey,
                      child: const Page2(),
                    );
                  case TransitionType.rToL:
                    return RToLPageTransition(
                      key: state.pageKey,
                      child: const Page2(),
                    );
                  case TransitionType.lToR:
                    return LToRPageTransition(
                      key: state.pageKey,
                      child: const Page2(),
                    );
                  case TransitionType.scale:
                    return ScalePageTransition(
                      key: state.pageKey,
                      child: const Page2(),
                    );
                  case TransitionType.bToT:
                    return BToTPageTransition(
                      key: state.pageKey,
                      child: const Page2(),
                    );
                  case TransitionType.tToB:
                    return TToBPageTransition(
                      key: state.pageKey,
                      child: const Page2(),
                    );
                  case TransitionType.mix:
                    return MixPageTransition(
                      key: state.pageKey,
                      child: const Page2(),
                    );
                }
              },
            ),
          ],
        ),
      ],
    ),
    GoRoute(
      parentNavigatorKey: rootNavigatorKey,
      path: '/${AppRoutes.page1}',
      name: AppRoutes.page1,
      pageBuilder: (context, state) => FadePageTransition(
        key: state.pageKey,
        child: const Page1(),
      ),
    ),
    GoRoute(
      parentNavigatorKey: rootNavigatorKey,
      path: '/${AppRoutes.page2}',
      name: AppRoutes.rootPage2,
      pageBuilder: (context, state) => FadePageTransition(
        key: state.pageKey,
        child: const Page2(),
      ),
    ),
  ],
);
