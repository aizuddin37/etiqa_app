part of 'list_cubit.dart';

class ListState extends AppState {
  final List<TodoList> list;

  ListState({
    required bool isLoading,
    required bool isInitialize,
    required this.list,
  }) : super(isLoading: isLoading, isInitialize: isInitialize);

  @override
  copyWith({
    bool? isLoading,
    bool? isInitialize,
    List<TodoList>? list,
  }) {
    return ListState(
      isLoading: isLoading ?? this.isLoading,
      isInitialize: isInitialize ?? this.isInitialize,
      list: list ?? this.list,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [isLoading, isInitialize, list];

  popUpMessage({bool? isLoading}) => MessageDialogState(
      isInitialize: isInitialize,
      isLoading: isLoading ?? this.isLoading,
      list: list);
}

class MessageDialogState extends ListState {
  MessageDialogState({
    required List<TodoList> list,
    required bool isLoading,
    required bool isInitialize,
  }) : super(list: list, isLoading: isLoading, isInitialize: isInitialize);
}
