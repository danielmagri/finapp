import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'get_it_config.config.dart';

final injector = GetIt.instance;

@InjectableInit()
void configureDependencies() => $initGetIt(injector);
