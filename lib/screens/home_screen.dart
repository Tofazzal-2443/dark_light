import 'package:dark_and_light/screens/profile_screen.dart';
import 'package:dark_and_light/screens/sign_in_screen.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dark'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('sdfsdfsdf'),
            MaterialButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=> SignInPage()));
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