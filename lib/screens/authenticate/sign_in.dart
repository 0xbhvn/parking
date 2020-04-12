import 'package:flutter/material.dart';
import 'package:parking/services/auth.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            'Welcome',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
        body: Container(
          child: Center(
            child: FlatButton(
              onPressed: () async {
                dynamic result = await _auth.signInAnon();

                if(result == null) {
                  print('Error siging in');
                } else {
                  print('Sign in successful');
                  print(result.uid);
                }
              },
              child: Text(
                'Anonymous Sign In',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16.0,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
