import 'package:flutter/material.dart' show protected;

import '../model/generic/failure.dart';
import '../model/generic/result.dart';

abstract class BaseUsecase {
  @protected
  Future<Result<T>> safeCall<T>(Future<T> Function() call) async {
    try {
      return Result.success(await call());
    } catch (e) {
      return Result.error(Failure.unknownFailure(e));
    }
  }

  @protected
  Result<T> safeCallSync<T>(T Function() call) {
    try {
      return Result.success(call());
    } catch (e) {
      return Result.error(Failure.unknownFailure(e));
    }
  }
}
