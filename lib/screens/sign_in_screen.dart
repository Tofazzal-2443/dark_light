import 'package:dark_and_light/provider/themes_provider.dart';
import 'package:dark_and_light/screens/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    final text = Provider.of<ThemeProvider>(context).themeMode == ThemeMode.dark
        ? "Dark Theme"
        : "Light Theme";
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Sign In",
          style: TextStyle(
            fontSize: 20,
            color: Colors.green,
          ),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              '$text',
              style: TextStyle(
                fontSize: 15,
                color: Colors.green,
              ),
            ),
            Text(
              'fsdkjfh fsdjhfkjhsd',
              style: TextStyle(
                fontSize: 15,
                color: Colors.blue,
              ),
            ),
            Icon(Icons.email),
            Icon(
              Icons.email,
              color: Theme.of(context).iconTheme.color,
            ),
            MaterialButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => ProfilePage()));
              },
              color: Colors.green,
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
