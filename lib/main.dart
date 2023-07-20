import 'package:contact_diary/routes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
  static _MyAppState of(BuildContext context) =>
      context.findAncestorStateOfType<_MyAppState>()!;
}

class _MyAppState extends State<MyApp> {
  bool isDark = true;
  ThemeMode _themeMode = ThemeMode.system;

  void changeTheme(ThemeMode themeMode){
    setState(() {
      _themeMode = themeMode;

    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      darkTheme: ThemeData.dark(),
      theme: ThemeData.light(),
      themeMode: _themeMode,
      initialRoute: contactsRoute,
      onGenerateRoute: genrateRoute,
    );
  }
}
