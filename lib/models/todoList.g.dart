// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todoList.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TodoList _$TodoListFromJson(Map<String, dynamic> json) => TodoList(
      title: json['title'] as String? ?? "",
      no: json['no'] as int?,
      start_date:
          const TimestampConverter().fromJson(json['start_date'] as Timestamp?),
      end_date:
          const TimestampConverter().fromJson(json['end_date'] as Timestamp?),
      completed: json['completed'] as bool?,
      status: json['status'] as bool?,
    );

Map<String, dynamic> _$TodoListToJson(TodoList instance) => <String, dynamic>{
      'no': instance.no,
      'title': instance.title,
      'start_date': const TimestampConverter().toJson(instance.start_date),
      'end_date': const TimestampConverter().toJson(instance.end_date),
      'status': instance.status,
      'completed': instance.completed,
    };
