import 'dart:async';
import 'dart:developer';

import 'package:flutter/foundation.dart';

import 'request_state.dart';

abstract class RequestProvider<Value> with ChangeNotifier {
  RequestProvider(
      {RequestState<Value, Exception> initial = const RequestState.initial()})
      : _requestState = initial;

  RequestState<Value, Exception> _requestState;

  RequestState<Value, Exception> get state => _requestState;

  bool _mounted = true;

  set _state(RequestState<Value, Exception> newState) {
    if (newState == _requestState) {
      return;
    }
    _requestState = newState;

    if (_mounted) {
      notifyListeners();
    }
  }

  Future<void> executeRequest({
    required ValueGetter<Future<Value>> requestBuilder,
    Exception? Function(Exception)? errorHandler,
  }) async {
    try {
      _state = _requestState.maybeMap(
        success: (result) => RequestState.loading(resultMaybe: result.value),
        orElse: () => RequestState<Value, Exception>.loading(),
      );

      final value = await requestBuilder();
      _state = RequestState.success(value);
    } catch (error, stack) {
      log('Request Error $error Stack $stack');
      final exception = (error is Exception) ? error : Exception();
      final stateException =
          errorHandler != null ? errorHandler(exception) : exception;
      if (stateException != null) {
        _state = RequestState.failure(stateException);
      } else {
        _state = const RequestState.initial();
      }
    }
  }

  @override
  void dispose() {
    _mounted = false;
    super.dispose();
  }

  void reset() => _state = const RequestState.initial();
}
