import 'package:flutter/material.dart';
import 'package:googlelogin/src/google_api/google_api.dart';
import '../loged_in/loged_in.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            signIn(context);
          },
          child: const Text('Google SignIn!'),
        ),
      ),
    );
  }
}

Future signIn(context) async {
  final user = await GoogleSignInApi.login();
  if (user == null) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Sign in Faild!'),
      ),
    );
  } else {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => LogedInPage(user: user),
      ),
    );
  }
}
