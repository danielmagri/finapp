import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';

import '../../../shared/usecases/categories_usecase.dart';

part 'initial_controller.g.dart';

@lazySingleton
class InitialController = _InitialControllerBase with _$InitialController;

class LazySingleton {
  const LazySingleton();
}

abstract class _InitialControllerBase with Store {
  final CategoriesUsecase _categoriesUsecase;

  _InitialControllerBase(this._categoriesUsecase);

  Future loadData() async {
    await _categoriesUsecase.getCategories();
  }
}
