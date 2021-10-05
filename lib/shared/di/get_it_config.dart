import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'get_it_config.config.dart';

final injector = GetIt.instance;

const service = Environment("service");
const usecase = Environment("usecase");

@InjectableInit()
void configureDependencies() => $initGetIt(injector, environmentFilter: NoEnvOrContainsAny({service.name, usecase.name}));
