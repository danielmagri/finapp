import 'package:cloud_firestore/cloud_firestore.dart';

abstract class IFireDatabase {
  CollectionReference get transactions;
  CollectionReference get payees;
  CollectionReference get categories;
}
