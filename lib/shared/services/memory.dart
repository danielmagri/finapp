import 'package:injectable/injectable.dart';

import '../di/get_it_config.dart';
import '../model/category.dart';
import '../model/transaction.dart';

@service
@singleton
class Memory {
  List<Transaction>? transactions;

  List<Category>? categories;
}
