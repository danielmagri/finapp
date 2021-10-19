import 'package:cloud_firestore/cloud_firestore.dart'
    show CollectionReference, FirebaseFirestore;
import 'package:injectable/injectable.dart';

import '../di/get_it_config.dart';
import 'interfaces/i_fire_database.dart';

@service
@Injectable(as: IFireDatabase)
class FireDatabase implements IFireDatabase {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  CollectionReference get transactions => firestore.collection('transactions');

  @override
  CollectionReference get payees => firestore.collection('payees');

  @override
  CollectionReference get categories => firestore.collection('categories');
}
