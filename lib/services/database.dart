import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:parking/models/parking.dart';
import 'package:parking/models/user.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});

  final CollectionReference parkingCollection =
      Firestore.instance.collection('parking');

  Future<void> updateUserData(String name, String vehicleNumber, bool isParked) async {
    return await parkingCollection.document(uid).setData({
      'name': name,
      'vehicleNumber': vehicleNumber,
      'isParked': isParked,
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

  UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return UserData(
      uid: uid;
      name: snapshot.data['name'];
      vehicleNumber: snapshot.data['vehicleNumber'];
    ),
  }

  Stream<List<Parking>> get parking {
    return parkingCollection.snapshots().map(_parkingListFromSnapshot);
  }

  Stream<UserData> get userData {
    return parkingCollection.document(uid).snapshots().map(_userDataFromSnapshot);
  }
}
