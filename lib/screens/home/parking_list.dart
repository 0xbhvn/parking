import 'package:flutter/material.dart';
import 'package:parking/screens/home/parking_tile.dart';
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

    return ListView.builder(
      itemCount: parkings.length,
      itemBuilder: (context, index) {
        return ParkingTile(parking: parkings[index],);
      },
    );
  }
}
