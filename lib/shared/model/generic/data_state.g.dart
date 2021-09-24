// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$DataState<T> on _DataStateBase<T>, Store {
  final _$_stateAtom = Atom(name: '_DataStateBase._state');

  @override
  StateType get _state {
    _$_stateAtom.reportRead();
    return super._state;
  }

  @override
  set _state(StateType value) {
    _$_stateAtom.reportWrite(value, super._state, () {
      super._state = value;
    });
  }

  final _$_DataStateBaseActionController =
      ActionController(name: '_DataStateBase');

  @override
  void setInitial() {
    final _$actionInfo = _$_DataStateBaseActionController.startAction(
        name: '_DataStateBase.setInitial');
    try {
      return super.setInitial();
    } finally {
      _$_DataStateBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setLoading() {
    final _$actionInfo = _$_DataStateBaseActionController.startAction(
        name: '_DataStateBase.setLoading');
    try {
      return super.setLoading();
    } finally {
      _$_DataStateBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setData(T? data) {
    final _$actionInfo = _$_DataStateBaseActionController.startAction(
        name: '_DataStateBase.setData');
    try {
      return super.setData(data);
    } finally {
      _$_DataStateBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setError(Failure? error) {
    final _$actionInfo = _$_DataStateBaseActionController.startAction(
        name: '_DataStateBase.setError');
    try {
      return super.setError(error);
    } finally {
      _$_DataStateBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
