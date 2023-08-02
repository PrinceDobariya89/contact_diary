import 'package:contact_diary/routes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isDark = true;
  void changeTheme(isDark) {
    setState(() {
      this.isDark = isDark;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      darkTheme: ThemeData.dark(),
      theme: ThemeData.light(),
      themeMode: isDark ? ThemeMode.dark : ThemeMode.light,
      initialRoute: contactsRoute,
      onGenerateRoute: genrateRoute,
    );
  }
}
