import 'package:cloud_firestore/cloud_firestore.dart';

abstract class IFireDatabase {
  WriteBatch get batch;

  CollectionReference get transactions;
  CollectionReference get budgets;
  CollectionReference get categories;
}
