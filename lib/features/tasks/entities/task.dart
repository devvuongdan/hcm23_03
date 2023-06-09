// // ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
// import 'dart:convert';

// import 'package:equatable/equatable.dart';

// enum TaskProgress {
//   imcoming,
//   inProgress,
//   done,
//   failure,
// }

// class Task extends Equatable {
//   final String? id;
//   final String? title;
//   final String? description;
//   final DateTime? startTime;
//   final DateTime? dueTime;
//   final List<TeamMember> teamMembers;
//   final List<TaskStage> taskStages;

//   const Task({
//     required this.id,
//     required this.title,
//     required this.description,
//     required this.startTime,
//     required this.dueTime,
//     required this.teamMembers,
//     required this.taskStages,
//   });

//   Task copyWith({
//     String? id,
//     String? title,
//     String? description,
//     DateTime? startTime,
//     DateTime? dueTime,
//     List<TeamMember>? teamMembers,
//     List<TaskStage>? stages,
//   }) {
//     return Task(
//       id: id ?? this.id,
//       title: title ?? this.title,
//       description: description ?? this.description,
//       startTime: startTime ?? this.startTime,
//       dueTime: dueTime ?? this.dueTime,
//       teamMembers: teamMembers ?? this.teamMembers,
//       taskStages: stages ?? taskStages,
//     );
//   }

//   @override
//   List<Object?> get props => [
//         id,
//         title,
//         description,
//         startTime,
//         dueTime,
//         teamMembers,
//         taskStages,
//       ];

//   Map<String, dynamic> toMap() {
//     return <String, dynamic>{
//       'id': id,
//       'title': title,
//       'description': description,
//       'startTime': startTime?.millisecondsSinceEpoch,
//       'dueTime': dueTime?.millisecondsSinceEpoch,
//       'teamMembers': teamMembers.map((x) => x.toMap()).toList(),
//       'taskStages': taskStages.map((x) => x.toMap()).toList(),
//     };
//   }

//   factory Task.fromMap(Map<String, dynamic> map) {
//     return Task(
//       id: map['id'] != null ? map['id'] as String : null,
//       title: map['title'] != null ? map['title'] as String : null,
//       description:
//           map['description'] != null ? map['description'] as String : null,
//       startTime:
//           map['startTime'] != null ? DateTime.tryParse(map['startTime']) : null,
//       dueTime:
//           map['dueTime'] != null ? DateTime.tryParse(map['dueTime']) : null,
//       teamMembers: List<TeamMember>.from(
//         (map['teamMembers'] as List? ?? []).map<TeamMember>(
//           (x) => TeamMember.fromMap(x as Map<String, dynamic>),
//         ),
//       ),
//       taskStages: List<TaskStage>.from(
//         (map['taskStages'] as List? ?? []).map<TaskStage>(
//           (x) => TaskStage.fromMap(x as Map<String, dynamic>),
//         ),
//       ),
//     );
//   }

//   String toJson() => json.encode(toMap());

//   factory Task.fromJson(String source) =>
//       Task.fromMap(json.decode(source) as Map<String, dynamic>);
// }

// class TaskStage extends Equatable {
//   final String? id;
//   bool? isDone;
//   final String? description;

//   TaskStage({
//     required this.id,
//     this.isDone,
//     required this.description,
//   });

//   TaskStage copyWith({
//     String? id,
//     bool? isDone,
//     String? description,
//   }) {
//     return TaskStage(
//       id: id ?? this.id,
//       isDone: isDone ?? this.isDone,
//       description: description ?? this.description,
//     );
//   }

//   @override
//   List<Object?> get props => [id, isDone, description];

//   Map<String, dynamic> toMap() {
//     return <String, dynamic>{
//       'id': id,
//       'isDone': isDone,
//       'description': description,
//     };
//   }

//   factory TaskStage.fromMap(Map<String, dynamic> map) {
//     return TaskStage(
//       id: map['id'] != null ? map['id'] as String : null,
//       isDone: map['isDone'] != null ? map['isDone'] as bool : null,
//       description:
//           map['description'] != null ? map['description'] as String : null,
//     );
//   }

//   String toJson() => json.encode(toMap());

//   factory TaskStage.fromJson(String source) =>
//       TaskStage.fromMap(json.decode(source) as Map<String, dynamic>);
// }

// class TeamMember extends Equatable {
//   final String? id;
//   final String? avatarUrl;
//   const TeamMember({
//     required this.id,
//     required this.avatarUrl,
//   });

//   @override
//   List<Object?> get props => [id, avatarUrl];

//   Map<String, dynamic> toMap() {
//     return <String, dynamic>{
//       'id': id,
//       'avatarUrl': avatarUrl,
//     };
//   }

//   factory TeamMember.fromMap(Map<String, dynamic> map) {
//     return TeamMember(
//       id: map['id'] != null ? map['id'] as String : null,
//       avatarUrl: map['avatarUrl'] != null ? map['avatarUrl'] as String : null,
//     );
//   }

//   String toJson() => json.encode(toMap());

//   factory TeamMember.fromJson(String source) =>
//       TeamMember.fromMap(json.decode(source) as Map<String, dynamic>);
// }
