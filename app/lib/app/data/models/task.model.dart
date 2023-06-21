import 'dart:convert';
import 'package:mobile/app/data/enums/task.enum.dart';
import 'package:mobile/app/data/enums/task.state.enum.dart';

class Task {
  int? id;
  String? key;
  int? idinstallation;
  String? title;
  String? description;
  DateTime? dateCreate;
  DateTime? dateConclused;
  TaskStateEnumm? state;
  TaskEnumm? task;
  DateTime? lastAttempt;

  Task({
    this.id,
    this.idinstallation,
    this.key,
    this.title,
    this.description,
    this.state,
    this.task,
    this.dateCreate,
    this.dateConclused,
    this.lastAttempt,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'idinstallation': idinstallation,
      'key': key,
      'description': description,
      'dateCreate': dateCreate,
      'dateConclused': dateConclused,
      'state': state,
      'task': task,
      'lastAttempt': lastAttempt,
    };
  }

  static Task fromMap(Map<String, dynamic> map) {
    return Task(
      id: map['id'],
      idinstallation: map['idinstallation'],
      key: map['key'],
      title: map['title'],
      description: map['description'],
      state: map['state'],
      task: map['task'],
      dateCreate: DateTime.parse(map['dateCreate']),
      dateConclused: DateTime.parse(map['dateConclused']),
      lastAttempt: DateTime.parse(map['lastAttempt']),
    );
  }

  String toJson() => json.encode(toMap());

  static fromJson(String source) => fromMap(json.decode(source));
}
