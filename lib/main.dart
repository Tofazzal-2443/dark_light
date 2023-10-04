import 'package:dark_and_light/provider/themes_provider.dart';
import 'package:dark_and_light/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ],
        builder: (context, _) {
          final themeProvider = Provider.of<ThemeProvider>(context);
          return MaterialApp(
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            themeMode: themeProvider.themeMode,
            theme: MyThemes.lightTheme,
            // applies this theme if the device theme is light mode
            darkTheme: MyThemes.darkTheme,
            // applies this theme if the device theme is dark mode
            home: HomePage(),
          );
        });
  }
}