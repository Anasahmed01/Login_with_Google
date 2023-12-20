// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:googlelogin/src/google_api/google_api.dart';
import 'package:googlelogin/src/views/home/home.dart';

class LogedInPage extends StatelessWidget {
  final GoogleSignInAccount user;
  const LogedInPage({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        actions: [
          ElevatedButton(
            onPressed: () async {
              await GoogleSignInApi.logout();
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => const Home(),
                ),
              );
            },
            child: const Text('LogOut'),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Profile'),
            SizedBox(
              height: 40,
            ),
            CircleAvatar(
              radius: 40,
              backgroundImage: NetworkImage(user.photoUrl!),
            ),
            SizedBox(
              height: 40,
            ),
            Text('Name:  ' + user.displayName!),
            SizedBox(
              height: 10,
            ),
            Text('Email:  ' + user.email),
          ],
        ),
      ),
    );
  }
}
