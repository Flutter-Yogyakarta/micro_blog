import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class UserPage extends StatefulWidget {
  final FirebaseUser user;

  const UserPage({Key key, this.user}) : super(key: key);
  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('Welcome'),
              ],
            ),
            Text(widget.user.displayName),
            Container(
              child: FlatButton.icon(
                icon: Icon(MdiIcons.logout),
                label: Text('Logout'),
                onPressed: () {},
              ),
            )
          ],
        ),
      ),
    );
  }
}
