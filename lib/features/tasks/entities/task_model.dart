// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:hcm23_03/features/authentication/data/resource/sqlite_helper.dart';

class Task extends DBModel {
  static const dbTable = "Task";
  final String userId;
  String title;
  String description;
  final String starttime;
  final String duetime;
  List<TeamMember> teamMembers;
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
  factory Task.fromMapToThumbnail(Map<String, dynamic> map) {
    return Task(
      uid: map['uid'].toString(),
      userId: map['userId'].toString(),
      title: map['title'].toString(),
      description: map['description'].toString(),
      starttime: map['starttime'].toString(),
      duetime: map['duetime'].toString(),
      teamMembers: [],
      stages: [],
    );
  }

  factory Task.fromMapToFullDetails(Map<String, dynamic> map) {
    return Task(
      uid: map['uid'].toString(),
      userId: map['userId'].toString(),
      title: map['title'].toString(),
      description: map['description'].toString(),
      starttime: map['starttime'].toString(),
      duetime: map['duetime'].toString(),
      teamMembers: List<TeamMember>.from(
        (map['teamMembers'] as List? ?? []).map<TeamMember>(
          (x) => TeamMember.fromMap(x as Map<String, dynamic>),
        ),
      ),
      stages: List<TaskStage>.from(
        (map['stages'] as List? ?? []).map<TaskStage>(
          (x) => TaskStage.fromMap(x as Map<String, dynamic>),
        ),
      ),
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
      'teamMembers': teamMembers.map((x) => x.toMap()).toList(),
      'stages': stages.map((x) => x.toMap()).toList(),
    };
  }

  @override
  String toString() {
    return 'Task(userId: $userId, title: $title, description: $description, starttime: $starttime, duetime: $duetime, teamMembers: $teamMembers, stages: $stages)';
  }

  Task copyWith({
    String? uid,
    String? userId,
    String? title,
    String? description,
    String? starttime,
    String? duetime,
    List<TeamMember>? teamMembers,
    List<TaskStage>? stages,
  }) {
    return Task(
      uid: uid ?? this.uid,
      userId: userId ?? this.userId,
      title: title ?? this.title,
      description: description ?? this.description,
      starttime: starttime ?? this.starttime,
      duetime: duetime ?? this.duetime,
      teamMembers: teamMembers ?? this.teamMembers,
      stages: stages ?? this.stages,
    );
  }
}

class TaskStage extends DBModel {
  static const dbTable = "TaskStage";
  bool isDone;
  String stageName;
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
      uid: map['uid'].toString(),
      taskUid: map['taskUid'].toString(),
      isDone: map['isDone'] == "true",
      stageName: map['stageName'].toString(),
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
      avatarUrl: map['avatarUrl'].toString(),
    );
  }
}
