import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'todoList.g.dart';

//----------------------------Data Model of TodoList-------------------------------------------------
@JsonSerializable()
class TodoList extends Equatable {
  int? no;
  String title;
  @TimestampConverter()
  final DateTime? start_date;
  @TimestampConverter()
  final DateTime? end_date;
  final bool? status;
  late final bool? completed;
  TodoList(
      {this.title = "",
      this.no,
      this.start_date,
      this.end_date,
      this.completed,
      this.status});

  factory TodoList.fromJson(Map<String, dynamic> json) =>
      _$TodoListFromJson(json);

  Map<String, dynamic> toJson() => _$TodoListToJson(this);

  @override
  toString() => 'no: $no'
      'title: $title'
      'start_date: $start_date'
      'status: $status'
      'end_date: $end_date'
      'completed: $completed';

  @override
  // TODO: implement props
  List<Object?> get props =>
      [no, title, start_date, end_date, status, completed];
}

class TimestampConverter implements JsonConverter<DateTime?, Timestamp?> {
  const TimestampConverter();

  @override
  DateTime? fromJson(Timestamp? timestamp) {
    return timestamp?.toDate();
  }

  @override
  Timestamp? toJson(DateTime? date) =>
      date == null ? null : Timestamp.fromDate(date);
}
