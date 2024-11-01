import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:storyloom/pages/contact/page.dart';
import 'package:storyloom/pages/contribute/page.dart';
import 'package:storyloom/pages/folktales/page.dart';
import 'package:storyloom/pages/genres/page.dart';
import 'package:storyloom/pages/homepage/page.dart';
import 'package:storyloom/pages/stories/page.dart';
import 'package:storyloom/widgets/main_layout.dart';

final GoRouter router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      pageBuilder: (context, state) =>
          _buildPageRoute(const MainLayout(child: HomePage())),
    ),
    GoRoute(
      path: '/genres',
      pageBuilder: (context, state) =>
          _buildPageRoute(const MainLayout(child: GenresPage())),
    ),
    GoRoute(
      path: '/folktales',
      pageBuilder: (context, state) =>
          _buildPageRoute(const MainLayout(child: FolktalesPage())),
    ),
    GoRoute(
      path: '/contribute',
      pageBuilder: (context, state) =>
          _buildPageRoute(const MainLayout(child: ContributePage())),
    ),
    GoRoute(
      path: '/contact',
      pageBuilder: (context, state) =>
          _buildPageRoute(const MainLayout(child: ContactPage())),
    ),
    GoRoute(
      path: '/stories',
      pageBuilder: (context, state) =>
          _buildPageRoute(const MainLayout(child: StoriesPage())),
    ),
  ],
);

Page<dynamic> _buildPageRoute(Widget child) {
  return CustomTransitionPage(
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = 0.0;
      const end = 1.0;
      const curve = Curves.easeIn;

      // Fade in animation for the new page
      var fadeInAnimation =
          Tween<double>(begin: begin, end: end).animate(CurvedAnimation(
        parent: animation,
        curve: curve,
      ));

      return FadeTransition(
        opacity: fadeInAnimation,
        child: child,
      );
    },
  );
}
