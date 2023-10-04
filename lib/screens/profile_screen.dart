import 'package:dark_and_light/provider/themes_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('sdfsdfsdf'),
        actions: [
          Switch(
            value: themeProvider.isDarkMode,
            onChanged: (value) async {
              final pro = Provider.of<ThemeProvider>(context, listen: false);
              pro.toggleTheme(value);
              print("------------${value.runtimeType}");
              SharedPreferences prefs = await SharedPreferences.getInstance();
              await prefs.setBool('theme', value);
            },
            activeTrackColor: Colors.lightGreenAccent,
            activeColor: Colors.green,
          )
        ],
      ),
    );
  }
}