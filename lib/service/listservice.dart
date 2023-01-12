import 'package:maybank_app/models/todoList.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

class TodoListService {
  List<TodoList> todoList = [];

//Get the List from the Firebase
  checkTodoList() async {
    QuerySnapshot TodoListsSnapshot =
        await FirebaseFirestore.instance.collection('list').get();

    TodoListsSnapshot.docs.forEach((document) {
      TodoList list =
          TodoList.fromJson(document.data() as Map<String, dynamic>);

      todoList.add(list);
    });

    print("todoList :" + todoList.toString());
    return this.todoList;
  }

  checkList(int id) async {
    var collection = FirebaseFirestore.instance.collection('list');

    DocumentSnapshot list = await collection.doc('${id}').get();

    if (list.exists) {
      TodoList _list = TodoList.fromJson(list.data() as Map<String, dynamic>);
      todoList.add(_list);
      print("todoList :" + todoList.toString());
    } else {
      print("document not found");
    }

    return this.todoList;
  }
}
