// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_transaction_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AddTransactionController on _AddTransactionControllerBase, Store {
  final _$transactionTypeSelectedAtom =
      Atom(name: '_AddTransactionControllerBase.transactionTypeSelected');

  @override
  int get transactionTypeSelected {
    _$transactionTypeSelectedAtom.reportRead();
    return super.transactionTypeSelected;
  }

  @override
  set transactionTypeSelected(int value) {
    _$transactionTypeSelectedAtom
        .reportWrite(value, super.transactionTypeSelected, () {
      super.transactionTypeSelected = value;
    });
  }

  final _$dateSelectedAtom =
      Atom(name: '_AddTransactionControllerBase.dateSelected');

  @override
  int get dateSelected {
    _$dateSelectedAtom.reportRead();
    return super.dateSelected;
  }

  @override
  set dateSelected(int value) {
    _$dateSelectedAtom.reportWrite(value, super.dateSelected, () {
      super.dateSelected = value;
    });
  }

  final _$showCategoryAtom =
      Atom(name: '_AddTransactionControllerBase.showCategory');

  @override
  bool get showCategory {
    _$showCategoryAtom.reportRead();
    return super.showCategory;
  }

  @override
  set showCategory(bool value) {
    _$showCategoryAtom.reportWrite(value, super.showCategory, () {
      super.showCategory = value;
    });
  }

  final _$_AddTransactionControllerBaseActionController =
      ActionController(name: '_AddTransactionControllerBase');

  @override
  void selectType(int index) {
    final _$actionInfo = _$_AddTransactionControllerBaseActionController
        .startAction(name: '_AddTransactionControllerBase.selectType');
    try {
      return super.selectType(index);
    } finally {
      _$_AddTransactionControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void selectDate(int index) {
    final _$actionInfo = _$_AddTransactionControllerBaseActionController
        .startAction(name: '_AddTransactionControllerBase.selectDate');
    try {
      return super.selectDate(index);
    } finally {
      _$_AddTransactionControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCustomDate(DateTime? data) {
    final _$actionInfo = _$_AddTransactionControllerBaseActionController
        .startAction(name: '_AddTransactionControllerBase.setCustomDate');
    try {
      return super.setCustomDate(data);
    } finally {
      _$_AddTransactionControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
transactionTypeSelected: ${transactionTypeSelected},
dateSelected: ${dateSelected},
showCategory: ${showCategory}
    ''';
  }
}
