import 'package:injectable/injectable.dart';

import '../../di/get_it_config.dart';
import '../../model/payee.dart';
import '../../services/interfaces/i_fire_database.dart';

abstract class IPayeesApi {
  Future<String> createPayee(Payee data);
  Future<List<Payee>> getPayees();
}

@repository
@Injectable(as: IPayeesApi)
class PayeesApi implements IPayeesApi {
  final IFireDatabase _fireDatabase;

  PayeesApi(this._fireDatabase);

  @override
  Future<String> createPayee(Payee data) async {
    return (await _fireDatabase.payees.add(data.toJson())).id;
  }

  @override
  Future<List<Payee>> getPayees() {
    return _fireDatabase.payees.get().then((value) => value.docs
        .map((e) => Payee.fromJson(e.data() as Map<String, dynamic>, e.id))
        .toList());
  }
}
