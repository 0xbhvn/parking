import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ParkingList extends StatefulWidget {
  @override
  _ParkingListState createState() => _ParkingListState();
}

class _ParkingListState extends State<ParkingList> {
  @override
  Widget build(BuildContext context) {
    final parking = Provider.of<QuerySnapshot>(context);

    for (var doc in parking.documents) {
      print(doc.data);
    }

    return Container();
  }
}
