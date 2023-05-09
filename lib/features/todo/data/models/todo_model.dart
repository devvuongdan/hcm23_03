import '../../domain/entities/todo_entity.dart';

class TodoModel extends TodoEntity {
  final DateTime? createdTime;
  final DateTime? updatedTime;
  const TodoModel({
    required super.uuid,
    required super.title,
    required super.content,
    required super.isDone,
    required super.startTime,
    required super.dueTime,
    required this.createdTime,
    required this.updatedTime,
  });

  @override
  List<Object?> get props => [
        title,
        content,
        isDone,
        startTime,
        dueTime,
        uuid,
        createdTime,
        updatedTime
      ];

  factory TodoModel.fromMap(Map<String, dynamic> json) {
    final TodoModel obj = TodoModel(
      uuid: json["uuid"],
      createdTime:
          DateTime.tryParse(json["createdTime"] as String) ?? DateTime.now(),
      updatedTime:
          DateTime.tryParse(json["updatedTime"] as String) ?? DateTime.now(),
      title: json["title"],
      content: json["content"],
      isDone: json["isDone"],
      startTime:
          DateTime.tryParse(json["startTime"] as String) ?? DateTime.now(),
      dueTime: DateTime.tryParse(json["dueTime"] as String) ?? DateTime.now(),
    );
    return obj;
  }
  TodoEntity toEntity(Map<String, dynamic> json) {
    final TodoEntity obj = TodoEntity(
      uuid: json["uuid"],
      title: json["title"],
      content: json["content"],
      isDone: json["isDone"],
      startTime:
          DateTime.tryParse(json["startTime"] as String) ?? DateTime.now(),
      dueTime: DateTime.tryParse(json["dueTime"] as String) ?? DateTime.now(),
    );
    return obj;
  }

  TodoEntity toEntityFromModel() {
    final TodoEntity obj = TodoEntity(
      uuid: uuid,
      title: title,
      content: content,
      isDone: isDone,
      startTime: startTime,
      dueTime: dueTime,
    );
    return obj;
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> map = {
      "uuid": uuid,
      "createdTime": createdTime?.toIso8601String(),
      "updatedTime": updatedTime?.toIso8601String(),
      "title": title,
      "content": content,
      "isDone": isDone,
      "startTime": startTime.toIso8601String(),
      "dueTime": dueTime.toIso8601String(),
    };
    return map;
  }

  TodoModel copyWith({
    required String? title,
    required String? content,
    required bool? isDone,
    required DateTime? startTime,
    required DateTime? dueTime,
    required DateTime? updatedTime,
  }) {
    return TodoModel(
      title: title ?? this.title,
      content: content ?? this.content,
      isDone: isDone ?? this.isDone,
      startTime: startTime ?? this.startTime,
      dueTime: dueTime ?? this.dueTime,
      updatedTime: updatedTime ?? this.updatedTime,

      //
      uuid: uuid,
      createdTime: createdTime,
    );
  }
}
