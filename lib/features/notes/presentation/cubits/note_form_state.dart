part of 'note_form_cubit.dart';

class NoteFormState extends Equatable {
  final String title;
  final String content;
  final bool isSubmitting;
  final bool isSuccess;
  final String? errorMessage;

  const NoteFormState({
    this.title = '',
    this.content = '',
    this.isSubmitting = false,
    this.isSuccess = false,
    this.errorMessage = '',
  });

  NoteFormState copyWith({
    String? title,
    String? content,
    bool? isSubmitting,
    bool? isSuccess,
    String? errorMessage,
  }) {
    return NoteFormState(
      title: title ?? this.title,
      content: content ?? this.content,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      isSuccess: isSuccess ?? this.isSuccess,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props =>
      [title, content, isSubmitting, isSuccess, errorMessage];
}
