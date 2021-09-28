// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../features/initial/presentation/initial_controller.dart' as _i4;
import '../../features/navigation/presentation/navigation_controller.dart'
    as _i5;
import '../routes/app_navigation.dart' as _i3;
import '../sharedPref/shared_pref.dart'
    as _i6; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.lazySingleton<_i3.AppNavigation>(() => _i3.AppNavigation());
  gh.lazySingleton<_i4.InitialController>(() => _i4.InitialController());
  gh.lazySingleton<_i5.NavigationController>(
      () => _i5.NavigationController(get<_i3.AppNavigation>()));
  gh.singletonAsync<_i6.SharedPref>(() => _i6.SharedPref.initialize());
  return get;
}
