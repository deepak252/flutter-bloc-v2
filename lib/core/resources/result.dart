import 'package:flutter_bloc_v2/core/resources/failure.dart';

abstract class Result<T> {
  final T? data;
  final Failure? failure;

  const Result({this.data, this.failure});
}

class ResultSuccess<T> extends Result<T> {
  const ResultSuccess({super.data});
}

class ResultFailure<T> extends Result<T> {
  const ResultFailure({super.failure, super.data});
}
