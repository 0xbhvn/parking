import 'package:flutter/material.dart';
import 'package:parking/models/parking.dart';
import 'package:parking/services/auth.dart';
import 'package:parking/services/database.dart';
import 'package:parking/screens/home/parking_list.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Parking >>.value(
      value: DatabaseService().parking,
      child: Container(
        child: SafeArea(
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              title: Text(
                'Home',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              actions: <Widget>[
                FlatButton.icon(
                    onPressed: () async {
                      await _auth.signOut();
                    },
                    icon: Icon(
                      Icons.person,
                    ),
                    label: Text('Logout'))
              ],
            ),
            body: ParkingList(),
          ),
        ),
      ),
    );
  }
}
