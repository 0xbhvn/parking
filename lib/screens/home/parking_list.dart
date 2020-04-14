import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:parking/models/parking.dart';

class ParkingList extends StatefulWidget {
  @override
  _ParkingListState createState() => _ParkingListState();
}

class _ParkingListState extends State<ParkingList> {
  @override
  Widget build(BuildContext context) {
    final parkings = Provider.of<List<Parking>>(context);

    parkings.forEach((parking){
      print(parking.name);
      print(parking.vehicleNumber);
    });

    return Container();
  }
}
