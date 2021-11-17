import 'package:cloud_firestore/cloud_firestore.dart';

abstract class IFireDatabase {
  WriteBatch get batch;

  CollectionReference get transactions;
  CollectionReference get categories;

  CollectionReference get budgets;
  CollectionReference budgetsCategories(String budget);
}
