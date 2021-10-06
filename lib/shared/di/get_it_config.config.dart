// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../features/initial/presentation/initial_controller.dart' as _i6;
import '../../features/navigation/presentation/navigation_controller.dart'
    as _i8;
import '../../features/transaction/bottomSheet/add_transaction_controller.dart'
    as _i12;
import '../../features/transaction/presentation/transaction_controller.dart'
    as _i13;
import '../routes/app_navigation.dart' as _i3;
import '../services/fire_database.dart' as _i5;
import '../services/interfaces/i_fire_database.dart' as _i4;
import '../services/memory.dart' as _i7;
import '../sharedPref/shared_pref.dart' as _i10;
import '../usecases/payees_usecase.dart' as _i9;
import '../usecases/transaction_usecase.dart' as _i11;

const String _service = 'service';
const String _usecase = 'usecase';
// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.lazySingleton<_i3.AppNavigation>(() => _i3.AppNavigation());
  gh.factory<_i4.IFireDatabase>(() => _i5.FireDatabase(),
      registerFor: {_service});
  gh.lazySingleton<_i6.InitialController>(() => _i6.InitialController());
  gh.singleton<_i7.Memory>(_i7.Memory(), registerFor: {_service});
  gh.lazySingleton<_i8.NavigationController>(
      () => _i8.NavigationController(get<_i3.AppNavigation>()));
  gh.factory<_i9.PayeesUsecase>(
      () => _i9.PayeesUsecase(get<_i4.IFireDatabase>(), get<_i7.Memory>()),
      registerFor: {_usecase});
  gh.singletonAsync<_i10.SharedPref>(() => _i10.SharedPref.initialize());
  gh.factory<_i11.TransactionUsecase>(
      () =>
          _i11.TransactionUsecase(get<_i4.IFireDatabase>(), get<_i7.Memory>()),
      registerFor: {_usecase});
  gh.lazySingleton<_i12.AddTransationController>(() =>
      _i12.AddTransationController(
          get<_i11.TransactionUsecase>(), get<_i9.PayeesUsecase>()));
  gh.lazySingleton<_i13.TransactionController>(() => _i13.TransactionController(
      get<_i11.TransactionUsecase>(), get<_i9.PayeesUsecase>()));
  return get;
}
