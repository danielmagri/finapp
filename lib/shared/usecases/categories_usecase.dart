import 'package:injectable/injectable.dart';

import '../base/base_usecase.dart';
import '../di/get_it_config.dart';
import '../model/category.dart';
import '../model/generic/result.dart';
import '../repositories/categories_api.dart';
import '../services/memory.dart';

@usecase
@injectable
class CategoriesUsecase extends BaseUsecase {
  final ICategoriesApi _categoriesApi;
  final Memory _memory;

  CategoriesUsecase(this._categoriesApi, this._memory);

  Future<Result<String>> createCategory(Category data) => safeCall(() async {
        final value = await _categoriesApi.createCategory(data);
        _memory.categories?.add(Category(id: value, title: data.title));
        return value;
      });

  Result<Category?> getCategoryExist(String text) => safeCallSync(() {
        if (_memory.categories != null) {
          return _memory.categories!.firstWhere((e) => e.title == text);
        } else {
          throw 'error';
        }
      });

  Future<Result<List<Category>>> getCategories() => safeCall(() async {
        if (_memory.categories == null) {
          final list = await _categoriesApi.getCategories();
          _memory.categories = list;
          return list;
        } else {
          return Future.value(_memory.categories);
        }
      });

  Category? getCategoryModel(String id) {
    try {
      return _memory.categories?.firstWhere((element) => element.id == id);
    } catch (e) {
      return null;
    }
  }
}
