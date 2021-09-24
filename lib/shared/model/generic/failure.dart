import 'package:flutter/foundation.dart';

abstract class Failure {
  Failure._();

  factory Failure.dataFailure(String value) = DataFailure;
  factory Failure.unknownFailure(dynamic error) = UnknownFailure;

  String get message;
}

class DataFailure extends Failure {
  DataFailure(this.value) : super._();

  final String value;

  @override
  String get message => value;
}

class UnknownFailure extends Failure {
  UnknownFailure(this.value) : super._();

  final dynamic value;

  @override
  String get message => kDebugMode ? value.toString() : 'S.current.genericError';
}
