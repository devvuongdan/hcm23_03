// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:hcm23_03/features/authentication/data/resource/sqlite_helper.dart';

class Task extends DBModel {
  static const dbTable = "Task";
  final String userId;
  late final String title;
  late final String description;
  final String starttime;
  final String duetime;
  final List<TeamMember> teamMembers;
  List<TaskStage> stages;
  Task({
    required super.uid,
    required this.userId,
    required this.title,
    required this.description,
    required this.starttime,
    required this.duetime,
    required this.teamMembers,
    required this.stages,
  });

  @override
  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      uid: map['uid'] as String,
      userId: map['userId'] as String,
      title: map['title'] as String,
      description: map['description'] as String,
      starttime: map['starttime'] as String,
      duetime: map['duetime'] as String,
      teamMembers: [],
      stages: [],
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'uid': uid,
      'userId': userId,
      'title': title,
      'description': description,
      'starttime': starttime,
      'duetime': duetime,
    };
  }
}

class TaskStage extends DBModel {
  static const dbTable = "TaskStage";
  final bool isDone;
  final String stageName;
  final String taskUid;

  TaskStage({
    required super.uid,
    required this.taskUid,
    required this.isDone,
    required this.stageName,
  });

  @override
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'uid': uid,
      'taskUid': taskUid,
      'isDone': isDone.toString(),
      'stageName': stageName,
    };
  }

  factory TaskStage.fromMap(Map<String, dynamic> map) {
    return TaskStage(
      uid: map['uid'] as String,
      taskUid: map['taskUid'] as String,
      isDone: map['isDone'] == "true",
      stageName: map['stageName'] as String,
    );
  }
}

class TeamMember extends DBModel {
  static const dbTable = "TeamMember";
  final String avatarUrl;
  final String taskUid;
  TeamMember({
    required super.uid,
    required this.avatarUrl,
    required this.taskUid,
  });

  @override
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'taskUid': taskUid,
      'uid': uid,
      'avatarUrl': avatarUrl,
    };
  }

  TeamMember copyWith({
    String? avatarUrl,
    String? taskUid,
  }) {
    return TeamMember(
      uid: super.uid,
      avatarUrl: avatarUrl ?? this.avatarUrl,
      taskUid: taskUid ?? this.taskUid,
    );
  }

  factory TeamMember.fromMap(Map<String, dynamic> map) {
    return TeamMember(
      taskUid: map['taskUid'],
      uid: map['uid'],
      avatarUrl: map['avatarUrl'] as String,
    );
  }
}
