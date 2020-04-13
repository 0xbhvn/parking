import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;
  DatabaseService({ this.uid });

  final CollectionReference parkingCollection = Firestore.instance.collection('parking');

  Future<void> updateUserData(String name, String vehicleNumber) async {
    return await parkingCollection.document(uid).setData({
      'name': name,
      'vehicleNumber': vehicleNumber,
    });
  }

}