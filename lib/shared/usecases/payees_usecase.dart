import 'package:injectable/injectable.dart';

import '../base/base_usecase.dart';
import '../di/get_it_config.dart';
import '../model/generic/result.dart';
import '../model/payee.dart';
import '../services/interfaces/i_fire_database.dart';
import '../services/memory.dart';

@usecase
@injectable
class PayeesUsecase extends BaseUsecase {
  final IFireDatabase _fireDatabase;
  final Memory _memory;

  PayeesUsecase(this._fireDatabase, this._memory);

  Future<Result<String>> createPayee(Payee data) => safeCall(() async {
        final value = await _fireDatabase.createPayee(data);
        _memory.payees?.add(Payee(id: value, title: data.title));
        return value;
      });

  Result<Payee?> getPayeeExist(String text) => safeCallSync(() {
        if (_memory.payees != null) {
          return _memory.payees!.firstWhere((e) => e.title == text);
        } else {
          throw 'error';
        }
      });

  Future<Result<List<Payee>>> getPayees() => safeCall(() async {
        if (_memory.payees == null) {
          final list = await _fireDatabase.getPayees();
          _memory.payees = list;
          return list;
        } else {
          return Future.value(_memory.payees);
        }
      });

  Payee? getPayeeModel(String id) {
    try {
      return _memory.payees?.firstWhere((element) => element.id == id);
    } catch (e) {
      return null;
    }
  }
}
