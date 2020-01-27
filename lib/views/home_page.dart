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
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading ? Container(
        child: Center(
          child: LinearProgressIndicator(backgroundColor: Colors.orange,),
        ),
      ) :
      isAuth ? UserPage() : LoginPage(),
    );
  }
}
