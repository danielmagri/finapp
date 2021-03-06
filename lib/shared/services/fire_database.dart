import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';

import '../di/get_it_config.dart';
import 'interfaces/i_fire_database.dart';

@service
@Injectable(as: IFireDatabase)
class FireDatabase implements IFireDatabase {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  WriteBatch get batch => firestore.batch();

  @override
  CollectionReference get transactions => firestore.collection('transactions');

  @override
  CollectionReference get categories => firestore.collection('categories');

  @override
  CollectionReference get budgets => firestore.collection('budgets');

  @override
  CollectionReference budgetsCategories(String budget) =>
      budgets.doc(budget).collection('categories');
}
