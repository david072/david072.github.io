import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:go_router/go_router.dart';
import 'package:portfolio/pages/home_page.dart';
import 'package:portfolio/pages/projects/cofence_page.dart';
import 'package:portfolio/pages/projects/fencing_tableau_page.dart';
import 'package:portfolio/pages/projects/funcially_page.dart';

void main() {
  usePathUrlStrategy();
  runApp(
    MaterialApp.router(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      theme: ThemeData.dark(useMaterial3: true),
      routerConfig: GoRouter(
        initialLocation: "/",
        routes: [
          GoRoute(
            path: "/",
            builder: (context, state) => const HomePage(),
            routes: [
              GoRoute(
                path: "fencing-tableau",
                builder: (context, state) => const FencingTableauPage(),
              ),
              GoRoute(
                path: "funcially",
                builder: (context, state) => const FunciallyPage(),
              ),
              GoRoute(
                path: "cofence",
                builder: (context, state) => const CofencePage(),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
