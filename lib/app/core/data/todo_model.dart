

class Todo {
  int? id;
  String title;
  String subtitle; // New
  String date; // New
  int isCompleted;

  Todo({
    this.id,
    required this.title,
    required this.subtitle, // New
    required this.date, // New
    this.isCompleted = 0,
  });

  factory Todo.fromMap(Map<String, dynamic> json) => Todo(
        id: json['id'],
        title: json['title'],
        subtitle: json['subtitle'],
        // New
        date: json['date'],
        // New
        isCompleted: json['isCompleted'],
      );

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'subtitle': subtitle, // New
      'date': date, // New
      'isCompleted': isCompleted,
    };
  }
}
