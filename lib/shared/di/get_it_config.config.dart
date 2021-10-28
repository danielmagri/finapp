// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../features/budget/presentation/budget_controller.dart' as _i17;
import '../../features/initial/presentation/initial_controller.dart' as _i12;
import '../../features/navigation/presentation/navigation_controller.dart'
    as _i13;
import '../../features/transaction/presentation/add/add_transaction_controller.dart'
    as _i16;
import '../../features/transaction/presentation/list/transaction_controller.dart'
    as _i18;
import '../repositories/budgets_api.dart' as _i5;
import '../repositories/categories_api.dart' as _i7;
import '../repositories/transactions_api.dart' as _i11;
import '../routes/app_navigation.dart' as _i3;
import '../services/fire_database.dart' as _i10;
import '../services/interfaces/i_fire_database.dart' as _i9;
import '../services/memory.dart' as _i8;
import '../sharedPref/shared_pref.dart' as _i14;
import '../usecases/budgets_usecase.dart' as _i4;
import '../usecases/categories_usecase.dart' as _i6;
import '../usecases/transaction_usecase.dart' as _i15;

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
  gh.factory<_i4.BudgetsUsecase>(
      () => _i4.BudgetsUsecase(get<_i5.IBudgetsApi>()),
      registerFor: {_usecase});
  gh.factory<_i6.CategoriesUsecase>(
      () => _i6.CategoriesUsecase(get<_i7.ICategoriesApi>(), get<_i8.Memory>()),
      registerFor: {_usecase});
  gh.factory<_i5.IBudgetsApi>(() => _i5.BudgetsApi(get<_i9.IFireDatabase>()),
      registerFor: {_repository});
  gh.factory<_i7.ICategoriesApi>(
      () => _i7.CategoriesApi(get<_i9.IFireDatabase>()),
      registerFor: {_repository});
  gh.factory<_i9.IFireDatabase>(() => _i10.FireDatabase(),
      registerFor: {_service});
  gh.factory<_i11.ITransactionsApi>(
      () => _i11.TransactionsApi(get<_i9.IFireDatabase>()),
      registerFor: {_repository});
  gh.lazySingleton<_i12.InitialController>(
      () => _i12.InitialController(get<_i6.CategoriesUsecase>()));
  gh.singleton<_i8.Memory>(_i8.Memory(), registerFor: {_service});
  gh.lazySingleton<_i13.NavigationController>(
      () => _i13.NavigationController(get<_i3.AppNavigation>()));
  gh.singletonAsync<_i14.SharedPref>(() => _i14.SharedPref.initialize());
  gh.factory<_i15.TransactionUsecase>(
      () => _i15.TransactionUsecase(
          get<_i11.ITransactionsApi>(), get<_i8.Memory>()),
      registerFor: {_usecase});
  gh.lazySingleton<_i16.AddTransactionController>(() =>
      _i16.AddTransactionController(
          get<_i15.TransactionUsecase>(), get<_i6.CategoriesUsecase>()));
  gh.lazySingleton<_i17.BudgetController>(() => _i17.BudgetController(
      get<_i6.CategoriesUsecase>(), get<_i4.BudgetsUsecase>()));
  gh.lazySingleton<_i18.TransactionController>(() => _i18.TransactionController(
      get<_i15.TransactionUsecase>(), get<_i6.CategoriesUsecase>()));
  return get;
}
