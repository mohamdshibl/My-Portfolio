import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../ui/web/home_page.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');

class AppRouter {
  static final router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const HomePage(),
      ),
      // Add more routes here if needed (e.g. project details)
    ],
  );
}
