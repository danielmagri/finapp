// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_transaction_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AddTransactionController on _AddTransactionControllerBase, Store {
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

  final _$_AddTransactionControllerBaseActionController =
      ActionController(name: '_AddTransactionControllerBase');

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
dateSelected: ${dateSelected}
    ''';
  }
}
