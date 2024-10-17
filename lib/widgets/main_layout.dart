import 'package:flutter/material.dart';
import 'package:storyloom/pages/contact/page.dart';
import 'package:storyloom/pages/contribute/page.dart';
import 'package:storyloom/pages/folktales/page.dart';
import 'package:storyloom/pages/genres/page.dart';
import 'package:storyloom/pages/homepage/page.dart';
import 'package:storyloom/pages/stories/page.dart';
import 'package:storyloom/widgets/topbar_widget.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  int _selectedPage = 0;

  // List of pages
  final List<Widget> _pages = [
    const HomePage(),
    const StoriesPage(),
    const GenresPage(),
    const FolktalesPage(),
    const ContributePage(),
    const ContactPage()
  ];

  void _onMenuItemSelected(int index) {
    setState(() {
      _selectedPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 0),
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 500),
              transitionBuilder: (Widget child, Animation<double> animation) {
                return FadeTransition(
                  opacity: animation,
                  child: child,
                );
              },
              child: _pages[_selectedPage],
            ),
          ),
          TopBarWidget(
            onMenuItemSelected: _onMenuItemSelected,
          ),
        ],
      ),
    );
  }
}
