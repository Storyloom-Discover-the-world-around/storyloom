import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:storyloom/pages/contact/page.dart';
import 'package:storyloom/pages/contribute/page.dart';
import 'package:storyloom/pages/folktales/page.dart';
import 'package:storyloom/pages/genres/page.dart';
import 'package:storyloom/pages/homepage/page.dart';
import 'package:storyloom/pages/stories/page.dart';
import 'package:storyloom/widgets/topbar_widget.dart';

class MainLayout extends StatefulWidget {
  final Widget child;
  const MainLayout({super.key, required this.child});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  int _selectedPage = 0;

  final List<Widget> _pages = [
    const HomePage(),
    const GenresPage(),
    const FolktalesPage(),
    const ContributePage(),
    const ContactPage(),
    const StoriesPage()
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
            // child: AnimatedSwitcher(
            //   duration: const Duration(milliseconds: 500),
            //   transitionBuilder: (Widget child, Animation<double> animation) {
            //     return FadeTransition(
            //       opacity: animation,
            //       child: child,
            //     );
            //   },
            //   child: _pages[_selectedPage],   
            // ),
            child: widget.child,
          ),
          TopBarWidget(
            // onMenuItemSelected: _onMenuItemSelected,
            onMenuItemSelected: (index) {
              switch (index) {
                case 0:
                  context.go('/');
                  break;
                case 1:
                  context.go('/genres');
                  break;
                case 2:
                  context.go('/folktales');
                  break;
                case 3:
                  context.go('/contribute');
                  break;
                case 4:
                  context.go('/contact');
                  break;
                case 5:
                  context.go('/stories');
                  break;
              }
            },
          ),
        ],
      ),
    );
  }
}
