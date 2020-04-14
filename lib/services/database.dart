import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:parking/models/parking.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});

  final CollectionReference parkingCollection =
      Firestore.instance.collection('parking');

  Future<void> updateUserData(String name, String vehicleNumber) async {
    return await parkingCollection.document(uid).setData({
      'name': name,
      'vehicleNumber': vehicleNumber,
    });
  }

  List<Parking> _parkingListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return Parking(
        name: doc.data['name'] ?? '',
        vehicleNumber: doc.data['vehicleNumber'] ?? '',
      );
    }).toList();
  }

  Stream<List<Parking>> get parking {
    return parkingCollection.snapshots().map(_parkingListFromSnapshot);
  }
}
