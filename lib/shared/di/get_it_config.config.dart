// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../features/initial/presentation/initial_controller.dart' as _i10;
import '../../features/navigation/presentation/navigation_controller.dart'
    as _i11;
import '../../features/transaction/presentation/add/add_transaction_controller.dart'
    as _i14;
import '../../features/transaction/presentation/list/transaction_controller.dart'
    as _i15;
import '../repositories/categories_api.dart' as _i5;
import '../repositories/transactions_api.dart' as _i9;
import '../routes/app_navigation.dart' as _i3;
import '../services/fire_database.dart' as _i8;
import '../services/interfaces/i_fire_database.dart' as _i7;
import '../services/memory.dart' as _i6;
import '../sharedPref/shared_pref.dart' as _i12;
import '../usecases/categories_usecase.dart' as _i4;
import '../usecases/transaction_usecase.dart' as _i13;

const String _usecase = 'usecase';
const String _repository = 'repository';
const String _service = 'service';
// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.lazySingleton<_i3.AppNavigation>(() => _i3.AppNavigation());
  gh.factory<_i4.CategoriesUsecase>(
      () => _i4.CategoriesUsecase(get<_i5.ICategoriesApi>(), get<_i6.Memory>()),
      registerFor: {_usecase});
  gh.factory<_i5.ICategoriesApi>(
      () => _i5.CategoriesApi(get<_i7.IFireDatabase>()),
      registerFor: {_repository});
  gh.factory<_i7.IFireDatabase>(() => _i8.FireDatabase(),
      registerFor: {_service});
  gh.factory<_i9.ITransactionsApi>(
      () => _i9.TransactionsApi(get<_i7.IFireDatabase>()),
      registerFor: {_repository});
  gh.lazySingleton<_i10.InitialController>(
      () => _i10.InitialController(get<_i4.CategoriesUsecase>()));
  gh.singleton<_i6.Memory>(_i6.Memory(), registerFor: {_service});
  gh.lazySingleton<_i11.NavigationController>(
      () => _i11.NavigationController(get<_i3.AppNavigation>()));
  gh.singletonAsync<_i12.SharedPref>(() => _i12.SharedPref.initialize());
  gh.factory<_i13.TransactionUsecase>(
      () => _i13.TransactionUsecase(
          get<_i9.ITransactionsApi>(), get<_i6.Memory>()),
      registerFor: {_usecase});
  gh.lazySingleton<_i14.AddTransactionController>(() =>
      _i14.AddTransactionController(
          get<_i13.TransactionUsecase>(), get<_i4.CategoriesUsecase>()));
  gh.lazySingleton<_i15.TransactionController>(() => _i15.TransactionController(
      get<_i13.TransactionUsecase>(), get<_i4.CategoriesUsecase>()));
  return get;
}
