// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'navigation_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$NavigationController on _NavigationControllerBase, Store {
  final _$pageIndexAtom = Atom(name: '_NavigationControllerBase.pageIndex');

  @override
  int get pageIndex {
    _$pageIndexAtom.reportRead();
    return super.pageIndex;
  }

  @override
  set pageIndex(int value) {
    _$pageIndexAtom.reportWrite(value, super.pageIndex, () {
      super.pageIndex = value;
    });
  }

  final _$_NavigationControllerBaseActionController =
      ActionController(name: '_NavigationControllerBase');

  @override
  void switchPage(int value) {
    final _$actionInfo = _$_NavigationControllerBaseActionController
        .startAction(name: '_NavigationControllerBase.switchPage');
    try {
      return super.switchPage(value);
    } finally {
      _$_NavigationControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
pageIndex: ${pageIndex}
    ''';
  }
}
