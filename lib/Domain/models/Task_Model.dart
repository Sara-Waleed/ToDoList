// class Task {
//   int? id;
//   String title;
//   DateTime date;
//   String priority;
//   int status; // 0 - Incomplete, 1 - Complete
//
//   Task({required this.title, required this.date,required this.priority,required this.status});
//
//   Task.withId({required this.id,required this.title,required this.date,required this.priority,required this.status});
//
//   Map<String, dynamic> toMap() {
//     final map = Map<String, dynamic>();
//     if (id != null) {
//       map['id'] = id;
//     }
//     map['title'] = title;
//     map['date'] = date.toIso8601String();
//     map['priority'] = priority;
//     map['status'] = status;
//     return map;
//   }
//
//   factory Task.fromMap(Map<String, dynamic> map) {
//     return Task.withId(
//       id: map['id'],
//       title: map['title'],
//       date: DateTime.parse(map['date']),
//       priority: map['priority'],
//       status: map['status'],
//     );
//   }
// }
// class Task {
//   final num? id;
//   final String content;
//   final DateTime date;
//   final String priority;
//   final int? status;
//
//   Task({required this.content, required this.date, required this.priority, this.status , this.id});
// }
class Task {
  final int? id;
  final String content;
  final DateTime date;
  final String priority;
  final int status;

  Task({
    this.id,
    required this.content,
    required this.date,
    required this.priority,
    this.status = 0, // Default status is 0 (Incomplete)
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'content': content,
      'date': date.toIso8601String(),
      'priority': priority,
      'status': status,
    };
  }

  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      id: map['id'],
      content: map['content'],
      date: DateTime.parse(map['date']),
      priority: map['priority'],
      status: map['status'],
    );
  }
}