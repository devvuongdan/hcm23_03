
// class Task extends Equatable {
//   final String id;
//   final String title;
//   final String description;
//   final String starttime;
//   final String duetime;
//   final List<TeamMember> teamMembers;
//   final List<TaskStage> stages;
//   const Task({
//     required this.id,
//     required this.title,
//     required this.description,
//     required this.starttime,
//     required this.duetime,
//     required this.teamMembers,
//     required this.stages,
//   });

//   Task copyWith({
//     String? id,
//     String? title,
//     String? description,
//     String? starttime,
//     String? duetime,
//     List<TeamMember>? teamMembers,
//     List<TaskStage>? stages,
//   }) {
//     return Task(
//       id: id ?? this.id,
//       title: title ?? this.title,
//       description: description ?? this.description,
//       starttime: starttime ?? this.starttime,
//       duetime: duetime ?? this.duetime,
//       teamMembers: teamMembers ?? this.teamMembers,
//       stages: stages ?? this.stages,
//     );
//   }

//   @override
//   List<Object?> get props => [
//         id,
//         title,
//         description,
//         starttime,
//         duetime,
//         teamMembers,
//         stages,
//       ];
// }

// class TaskStage extends Equatable {
//   final String id;
//   final bool isDone;
//   final String stageName;

//   const TaskStage({
//     required this.id,
//     required this.isDone,
//     required this.stageName,
//   });

//   TaskStage copyWith({
//     String? id,
//     bool? isDone,
//     String? stageName,
//   }) {
//     return TaskStage(
//       id: id ?? this.id,
//       isDone: isDone ?? this.isDone,
//       stageName: stageName ?? this.stageName,
//     );
//   }

//   @override
//   List<Object?> get props => [id, isDone, stageName];
// }

// class TeamMember extends Equatable {
//   final String id;
//   final String avatarUrl;
//   const TeamMember({
//     required this.id,
//     required this.avatarUrl,
//   });

//   @override
//   List<Object?> get props => [id, avatarUrl];
// }

// List<Task> tasks = [
//   const Task(
//     id: '1',
//     title: 'Meeting with Client',
//     description:
//         'To discuss about the upcoming project & organization of figma files.',
//     starttime: '08:30 AM',
//     duetime: '09:30 AM',
//     teamMembers: [
//       TeamMember(id: '1', avatarUrl: 'avatar_url_1'),
//       TeamMember(id: '2', avatarUrl: 'avatar_url_2'),
//       TeamMember(id: '3', avatarUrl: 'avatar_url_3'),
//     ],
//     stages: [
//       TaskStage(id: '1', isDone: false, stageName: 'Stage 1'),
//       TaskStage(id: '2', isDone: true, stageName: 'Stage 2'),
//       TaskStage(id: '3', isDone: false, stageName: 'Stage 3'),
//     ],
//   ),
//   const Task(
//     id: '2',
//     title: 'Lunch Break',
//     description: 'To discuss about the upcoming meeting.',
//     starttime: '09:30 AM',
//     duetime: '10:30 AM',
//     teamMembers: [
//       TeamMember(id: '1', avatarUrl: 'avatar_url_1'),
//       TeamMember(id: '2', avatarUrl: 'avatar_url_2'),
//       TeamMember(id: '3', avatarUrl: 'avatar_url_3'),
//     ],
//     stages: [
//       TaskStage(id: '1', isDone: false, stageName: 'Stage 1'),
//       TaskStage(id: '2', isDone: true, stageName: 'Stage 2'),
//       TaskStage(id: '3', isDone: false, stageName: 'Stage 3'),
//     ],
//   ),
//   const Task(
//     id: '3',
//     title: 'Daily Stand-up',
//     description:
//         'A stand-up meeting is a meeting in which attendees typically participate while standing. The discomfort...',
//     starttime: '10:30 AM',
//     duetime: '11:30 AM',
//     teamMembers: [
//       TeamMember(id: '1', avatarUrl: 'avatar_url_1'),
//       TeamMember(id: '2', avatarUrl: 'avatar_url_2'),
//       TeamMember(id: '3', avatarUrl: 'avatar_url_3'),
//     ],
//     stages: [
//       TaskStage(id: '1', isDone: false, stageName: 'Stage 1'),
//       TaskStage(id: '2', isDone: true, stageName: 'Stage 2'),
//       TaskStage(id: '3', isDone: false, stageName: 'Stage 3'),
//     ],
//   ),
// ];
