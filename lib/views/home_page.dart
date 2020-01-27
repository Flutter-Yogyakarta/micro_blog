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
    var user = await authenticationRepository.isSignIn();
    setState(() {
      if(user != null){
        isLoading = false;
        isAuth = true;
      }else{
        isLoading = false;
        isAuth = false;
      }
    });
    
    print('c');

  }
}
