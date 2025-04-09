import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:superbase_auth/src/featured/auth/presentation/register_screen.dart';

import '../featured/home/presentation/home_screen.dart';
import '../featured/root/root_screen.dart';
import '../featured/onboarding/onboarding_screen.dart';
import '../featured/auth/presentation/login_screen.dart';

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
      ),
      GoRoute(
        path: Routes.OnboardingScreenRoute,
        name: Routes.OnboardingScreenRoute,
        builder: (context, state) => OnboardingScreen(),
        routes: [
          GoRoute(
            path: Routes.LoginScreenRoute,
            name: Routes.LoginScreenRoute,
            builder: (context, state) => const LoginScreen(),
          ),
          GoRoute(
            path: Routes.RegisterScreenRoute,
            name: Routes.RegisterScreenRoute,
            builder: (context, state) => const RegisterScreen(),
          ),
        ],
      ),
      GoRoute(
        path: Routes.HomeScreenRoute,
        name: Routes.HomeScreenRoute,
        builder: (context, state) => HomeScreen(),
      )
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
