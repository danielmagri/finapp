// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../features/initial/presentation/initial_controller.dart' as _i14;
import '../../features/navigation/presentation/navigation_controller.dart'
    as _i9;
import '../../features/transaction/bottomSheet/add_transaction_controller.dart'
    as _i13;
import '../../features/transaction/presentation/transaction_controller.dart'
    as _i15;
import '../repositories/api/payees_api.dart' as _i6;
import '../repositories/api/transactions_api.dart' as _i7;
import '../routes/app_navigation.dart' as _i3;
import '../services/fire_database.dart' as _i5;
import '../services/interfaces/i_fire_database.dart' as _i4;
import '../services/memory.dart' as _i8;
import '../sharedPref/shared_pref.dart' as _i11;
import '../usecases/payees_usecase.dart' as _i10;
import '../usecases/transaction_usecase.dart' as _i12;

const String _service = 'service';
const String _repository = 'repository';
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
  gh.factory<_i6.IPayeesApi>(() => _i6.PayeesApi(get<_i4.IFireDatabase>()),
      registerFor: {_repository});
  gh.factory<_i7.ITransactionsApi>(
      () => _i7.TransactionsApi(get<_i4.IFireDatabase>()),
      registerFor: {_repository});
  gh.singleton<_i8.Memory>(_i8.Memory(), registerFor: {_service});
  gh.lazySingleton<_i9.NavigationController>(
      () => _i9.NavigationController(get<_i3.AppNavigation>()));
  gh.factory<_i10.PayeesUsecase>(
      () => _i10.PayeesUsecase(get<_i6.IPayeesApi>(), get<_i8.Memory>()),
      registerFor: {_usecase});
  gh.singletonAsync<_i11.SharedPref>(() => _i11.SharedPref.initialize());
  gh.factory<_i12.TransactionUsecase>(
      () => _i12.TransactionUsecase(
          get<_i7.ITransactionsApi>(), get<_i8.Memory>()),
      registerFor: {_usecase});
  gh.lazySingleton<_i13.AddTransationController>(() =>
      _i13.AddTransationController(
          get<_i12.TransactionUsecase>(), get<_i10.PayeesUsecase>()));
  gh.lazySingleton<_i14.InitialController>(
      () => _i14.InitialController(get<_i10.PayeesUsecase>()));
  gh.lazySingleton<_i15.TransactionController>(() => _i15.TransactionController(
      get<_i12.TransactionUsecase>(), get<_i10.PayeesUsecase>()));
  return get;
}
