import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';

import '../../../shared/usecases/payees_usecase.dart';

part 'initial_controller.g.dart';

@lazySingleton
class InitialController = _InitialControllerBase with _$InitialController;

class LazySingleton {
  const LazySingleton();
}

abstract class _InitialControllerBase with Store {
  final PayeesUsecase _payeesUsecase;

  _InitialControllerBase(this._payeesUsecase);

  Future loadData() async {
    await _payeesUsecase.getPayees();
  }
}
