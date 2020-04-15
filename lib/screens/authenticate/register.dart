import 'package:flutter/material.dart';
import 'package:parking/services/auth.dart';

class Register extends StatefulWidget {
  final Function toggleView;
  Register({this.toggleView});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  String name = '';
  String email = '';
  String password = '';
  String vehicleNumber = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            'Register',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          actions: <Widget>[
            FlatButton.icon(
              onPressed: () {
                widget.toggleView();
              },
              icon: Icon(Icons.person),
              label: Text('Sign In'),
            )
          ],
        ),
        body: Container(
          padding: EdgeInsets.symmetric(vertical: 50.0, horizontal: 50.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  onChanged: (val) {
                    setState(() => name = val);
                  },
                  validator: (val) =>
                      val.isEmpty ? 'Name cannot be empty.' : null,
                  decoration: InputDecoration(
                    hintText: 'Name',
                  ),
                ),
                SizedBox(height: 20.0),
                TextFormField(
                  onChanged: (val) {
                    setState(() => email = val);
                  },
                  validator: (val) =>
                      val.isEmpty ? 'Email cannot be empty.' : null,
                  decoration: InputDecoration(
                    hintText: 'Email',
                  ),
                ),
                SizedBox(height: 20.0),
                TextFormField(
                  obscureText: true,
                  onChanged: (val) {
                    setState(() => password = val);
                  },
                  validator: (val) =>
                      val.length < 6 ? 'Password too short.' : null,
                  decoration: InputDecoration(
                    hintText: 'Password',
                  ),
                ),
                SizedBox(height: 20.0),
                TextFormField(
                  onChanged: (val) {
                    setState(() => vehicleNumber = val);
                  },
                  validator: (val) =>
                      val.isEmpty ? 'Vehicle Number cannot be empty.' : null,
                  decoration: InputDecoration(
                    hintText: 'Vehicle Number',
                  ),
                ),
                SizedBox(height: 20.0),
                RaisedButton(
                  onPressed: () async {
                    if (_formKey.currentState.validate()) {
                      dynamic result = await _auth.registerWithEmailAndPassword(
                          name, email, password, vehicleNumber);

                      if (result == null) {
                        setState(() {
                          error = 'Invalid input.';
                        });
                      }
                    }
                  },
                  color: Colors.black,
                  child: Text(
                    'Register',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                SizedBox(height: 20.0),
                Text(
                  error,
                  style: TextStyle(color: Colors.red, fontSize: 14.0),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
