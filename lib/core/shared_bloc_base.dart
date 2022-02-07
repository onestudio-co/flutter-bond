import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';

import 'errors/failures.dart';

class SharedBlocBase<State> extends BlocBase<State> {
  SharedBlocBase(State state) : super(state);

  Map<String, dynamic>? error = <String, dynamic>{};
  String? code = "";

  String? getError(String key) {
    if (error == null) {
      return null;
    }
    if (error?[key] == null) {
      return null;
    } else {
      return error?[key].toString().replaceAll("[", " ").replaceAll("]", " ");
    }
  }

  toMessage(Failure failure) {
    if (failure is ServerFailure) {
      error = failure.error["errors"];
      if (failure.error["code"] != null) {
        code = failure.error["code"];
      }
    }

    return failure.toMessage();
  }

  clearKeyError(String key) {
    if (error?[key] != null) {
      error?.remove(key);
    }
  }

  toCode(Failure failure) {
    if (failure is ServerFailure) {
      debugPrint("ssss ${failure.error}");

      if (failure.error["code"] != null) {
        code = failure.error["code"];
        return code;
      } else {
        return "";
      }
    }
    return "";
  }
}
