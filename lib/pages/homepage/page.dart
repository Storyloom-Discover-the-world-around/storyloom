import 'package:flutter/material.dart';
import 'package:storyloom/widgets/Home_screen_widgets/Forktail_widget/forktail_widget.dart';
import 'package:storyloom/widgets/Home_screen_widgets/Hero_widget/hero_widget.dart';
import 'package:storyloom/widgets/Home_screen_widgets/Highlight_widget/Highlight_widget.dart';
import 'package:storyloom/widgets/footer_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: screenHeight,
              child: const HeroSection(),
            ),
            ForktailWidget(),
            HighlightWidget(),
            FooterWidget(),
          ],
        ),
      ),
    );
  }
}
