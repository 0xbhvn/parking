import 'package:flutter/material.dart';
import 'package:parking/models/parking.dart';

class ParkingTile extends StatelessWidget {
  final Parking parking;

  ParkingTile({this.parking});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Card(
        margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 20.0),
        child: ListTile(
          leading: Text('22'),
          title: Text(parking.vehicleNumber),
          subtitle: Text(parking.name),
        ),
      ),
    );
  }
}
