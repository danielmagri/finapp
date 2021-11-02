// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'budget_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$BudgetController on _BudgetControllerBase, Store {
  final _$currentDateAtom = Atom(name: '_BudgetControllerBase.currentDate');

  @override
  DateTime get currentDate {
    _$currentDateAtom.reportRead();
    return super.currentDate;
  }

  @override
  set currentDate(DateTime value) {
    _$currentDateAtom.reportWrite(value, super.currentDate, () {
      super.currentDate = value;
    });
  }

  @override
  String toString() {
    return '''
currentDate: ${currentDate}
    ''';
  }
}
