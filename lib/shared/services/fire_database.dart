import 'package:cloud_firestore/cloud_firestore.dart'
    show CollectionReference, FirebaseFirestore;
import 'package:injectable/injectable.dart';

import '../di/get_it_config.dart';
import '../model/payee.dart';
import '../model/transaction.dart';
import 'interfaces/i_fire_database.dart';

@service
@Injectable(as: IFireDatabase)
class FireDatabase implements IFireDatabase {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  CollectionReference get transactions => firestore.collection('transactions');
  CollectionReference get payees => firestore.collection('payees');

  @override
  Future<String> addTransaction(Transaction data) async {
    return (await transactions.add(data.toJson())).id;
  }

  @override
  Future<List<Transaction>> getTransactions() async {
    return transactions.get().then((value) => value.docs
        .map(
            (e) => Transaction.fromJson(e.data() as Map<String, dynamic>, e.id))
        .toList());
  }

  @override
  Future<String> createPayee(Payee data) async {
    return (await payees.add(data.toJson())).id;
  }

  @override
  Future<List<Payee>> getPayees() {
    return payees.get().then((value) => value.docs
        .map((e) => Payee.fromJson(e.data() as Map<String, dynamic>, e.id))
        .toList());
  }
}
