import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:maybank_app/cubit/app_state.dart';
import 'package:maybank_app/models/todoList.dart';
import 'package:maybank_app/service/listservice.dart';

part 'list_state.dart';

class ListCubit extends Cubit<ListState> {
  late final List<TodoList>? list;

  ListCubit({this.list})
      : super(ListState(isLoading: false, isInitialize: false, list: [])) {
    init();
  }

  init() {
    _checkTodoList();
    return Future.value();
  }

  void refresh(List<TodoList> list) {
    emit(state.copyWith(isInitialize: false, isLoading: true));

    init();
  }

  Future _checkTodoList() async {
    emit(state.copyWith(isLoading: true));
    List<TodoList>? list = await TodoListService().checkTodoList();
    if (TodoList != null) {
      emit(state.copyWith(list: list, isLoading: false));
      print("the TodoLists " + state.list.toString());
    } else {
      print(e);
    }
  }

  Future checkList(int id) async {
    emit(state.copyWith(isLoading: true));
    List<TodoList>? list = await TodoListService().checkList(id);
    if (TodoList != null) {
      emit(state.copyWith(list: list, isLoading: false));
      print("the TodoLists " + state.list.toString());
    } else {
      print(e);
    }
  }

  Future onComplete(int id, bool completed, List<TodoList> list) async {
    emit(state.copyWith(isLoading: true));

    if (state.list[id].completed != completed) {
      await FirebaseFirestore.instance
          .collection("list")
          .doc(state.list[id].no.toString())
          .delete();
      print("Completed ");
      List<TodoList>? list = await TodoListService().checkTodoList();

      emit(state.copyWith(list: list));
      emit(state.popUpMessage(isLoading: false));
    } else {
      print('No Change');
    }
    return Future.value();
  }

  Future onAddList(DateTime start, DateTime end, String title, int id) async {
    emit(state.copyWith(isLoading: true));

    Timestamp startTimestamp =
        Timestamp.fromMicrosecondsSinceEpoch(start.microsecondsSinceEpoch);
    Timestamp endTimestamp =
        Timestamp.fromMicrosecondsSinceEpoch(end.microsecondsSinceEpoch);
    var stocks = FirebaseFirestore.instance.collection('list');

    try {
      stocks.doc('${id}').set({
        'no': id,
        'completed': false,
        'start_date': startTimestamp,
        'end_date': endTimestamp,
        'title': title,
        'status': false
      });
      List<TodoList>? list = await TodoListService().checkTodoList();

      print("success");
      emit(state.popUpMessage(isLoading: false));
    } catch (e) {
      print(e);
    }
  }
}
