import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final CollectionReference parkingCollection =
      Firestore.instance.collection('parkings');
}
