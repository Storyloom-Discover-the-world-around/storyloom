// lib/main.dart
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:storyloom/localization/demo_localization.dart';
import 'package:storyloom/widgets/main_layout.dart';

void main() {
  runApp(const StoryLoomApp());
}

class StoryLoomApp extends StatefulWidget {
  const StoryLoomApp({super.key});
  static void setLocale(BuildContext context, Locale locale) {
    _StoryLoomAppState? state =
        context.findAncestorStateOfType<_StoryLoomAppState>();
    state!.setLocale(locale);
  }

  @override
  State<StoryLoomApp> createState() => _StoryLoomAppState();
}

class _StoryLoomAppState extends State<StoryLoomApp> {
  Locale _locale = Locale('en', 'US');

  void setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Storyloom',
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        DemoLocalization.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      locale: _locale,
      supportedLocales: [
        Locale('en', 'US'),
        Locale('ru', 'RU'),
        Locale('de', 'DE'),
      ],
      localeResolutionCallback: (deviceLocale, supportedLocales) {
        for (var locale in supportedLocales) {
          if (locale.languageCode == deviceLocale?.languageCode &&
              locale.countryCode == deviceLocale?.countryCode) {
            return deviceLocale;
          }
        }

        return supportedLocales.first; // Or return supportedLocales;
      },
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.black,
      ),
      home: const MainLayout(),
    );
  }
}
