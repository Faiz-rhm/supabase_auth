import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../featured/root/root_screen.dart';

import 'routes.dart';

final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>();

// final _shellNavigatorKey = GlobalKey<NavigatorState>();
final goRouteProvider = Provider<GoRouter>((ref) {

  return GoRouter(
    initialLocation: '/',
    debugLogDiagnostics: true,
    navigatorKey: rootNavigatorKey,
    observers: <NavigatorObserver>[],
    routes: <RouteBase>[
      GoRoute(
        name: Routes.initialRoute,
        path: '/',
        builder: (context, state) => const RootScreen(),
        routes: <RouteBase>[
        ],
      ),
      // GoRoute(
      //   name: Routes.NotificationPermissionScreenRoute,
      //   path: Routes.NotificationPermissionScreenRoute,
      //   builder: (BuildContext context, GoRouterState state) => const NotificationPermissionScreen(),
      // ),
    ],
    redirect: (BuildContext context, GoRouterState state) {
      return null;
    },
  );
});
