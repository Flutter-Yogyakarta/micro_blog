import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:micro_blog/repositories/authentication_repository.dart';
import 'package:micro_blog/views/views.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final AuthenticationRepository authenticationRepository = AuthenticationRepository();
  bool isAuth = false;
  bool isLoading = true;
  FirebaseUser firebaseUser;

  @override
  void initState() {
    super.initState();
    _auth();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading
          ? Container(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    LinearProgressIndicator(
                      backgroundColor: Colors.orange,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Text('Loading...'),
                    )
                  ],
                ),
              ),
            )
          : isAuth
              ? UserPage(
                  user: firebaseUser,
                )
              : LoginPage(),
    );
  }

  _auth() async {
    var user = await authenticationRepository.isSignIn();
    setState(() {
      if (user != null) {
        isLoading = false;
        isAuth = true;
        firebaseUser = user;
      } else {
        isLoading = false;
        isAuth = false;
      }
    });
  }
}
