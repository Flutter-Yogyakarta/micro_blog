import 'package:flutter/material.dart';
import 'package:micro_blog/views/views.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isAuth = false;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _auth();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading ? Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              LinearProgressIndicator(backgroundColor: Colors.orange,),
              Container(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Text('Loading...'),)
            ],
          ),
        ),
      ) :
      isAuth ? UserPage() : LoginPage(),
    );
  }

  _auth() async {

  }
}
