import 'package:cloud_firestore/cloud_firestore.dart';

enum FirebaseCollections {
  users,
  addresses,
  categories,
  products,
  types,
  status,
  addTypes;

  CollectionReference get reference => FirebaseFirestore.instance.collection(name);
}
