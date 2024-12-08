import 'package:equatable/equatable.dart';

class AsyncState<T> extends Equatable {
  final T? value;
  final bool isLoading;
  final String? errorMessage;

  const AsyncState({
    this.value,
    this.isLoading = false,
    this.errorMessage,
  });

  AsyncState<T> copyWith({
    T? value,
    bool? isLoading,
    String? errorMessage,
  }) {
    return AsyncState<T>(
      value: value ?? this.value,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [value, isLoading, errorMessage];
}
