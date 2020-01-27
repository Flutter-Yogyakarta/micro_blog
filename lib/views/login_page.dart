import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:micro_blog/repositories/authentication_repository.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: FlatButton.icon(
            color: Colors.orange,
            colorBrightness: Brightness.dark,
            icon: Icon(
              MdiIcons.google,
            ),
            label: Text('Login with Google'),
            onPressed: (){
              AuthenticationRepository().signInWithGoogle();
            },
          ),
        ),
      ),
    );
  }
}
