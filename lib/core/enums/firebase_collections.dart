import 'package:cloud_firestore/cloud_firestore.dart';

enum FirebaseCollections {
  users,
  addresses,
  categories,
  products,
  type,
  status,
  addTypes;

  CollectionReference get reference =>
      FirebaseFirestore.instance.collection(name);
}
