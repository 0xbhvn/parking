import 'package:flutter/material.dart';
import 'package:parking/models/user.dart';
import 'package:parking/screens/authenticate/authenticate.dart';
import 'package:parking/screens/home/home.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    if (user == null) {
      return Authenticate();
    } else {
      return Home();
    }
  }
}
