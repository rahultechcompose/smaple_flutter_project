class Result<S, E> {
  final S _data;
  final E _error;

  const Result._(this._data, this._error);

  factory Result.success(S data) {
    return Result._(data, null);
  }

  factory Result.error(E error) {
    return Result._(null, error);
  }

  bool isSuccess() => _data != null;

  bool isError() => _data == null;

  E get error {
    assert(isError());
    return _error;
  }

  S get data {
    assert(isSuccess());
    return _data;
  }

  R when<R>({
    R Function(S) onSuccess,
    R Function(E) onError,
  }) {
    if (isSuccess()) {
      return onSuccess?.call(data);
    }
    if (isError()) {
      return onError?.call(error);
    }
    throw Exception("Result could either be success or Error");
  }
}
