import 'package:injectable/injectable.dart';

import '../di/get_it_config.dart';
import '../model/payee.dart';

@service
@singleton
class Memory {
  List<Payee>? payees;
}
