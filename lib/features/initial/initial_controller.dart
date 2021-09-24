import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';

part 'initial_controller.g.dart';

@lazySingleton
class InitialController = _InitialControllerBase with _$InitialController;

class LazySingleton {
  const LazySingleton();
}

abstract class _InitialControllerBase with Store {
  
}