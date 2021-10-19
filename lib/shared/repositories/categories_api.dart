import 'package:injectable/injectable.dart';

import '../di/get_it_config.dart';
import '../model/category.dart';
import '../services/interfaces/i_fire_database.dart';

abstract class ICategoriesApi {
  Future<String> createCategory(Category data);
  Future<List<Category>> getCategories();
}

@repository
@Injectable(as: ICategoriesApi)
class CategoriesApi implements ICategoriesApi {
  final IFireDatabase _fireDatabase;

  CategoriesApi(this._fireDatabase);

  @override
  Future<String> createCategory(Category data) async {
    return (await _fireDatabase.categories.add(data.toJson())).id;
  }

  @override
  Future<List<Category>> getCategories() {
    return _fireDatabase.categories.get().then((value) => value.docs
        .map((e) => Category.fromJson(e.data() as Map<String, dynamic>, e.id))
        .toList());
  }
}
