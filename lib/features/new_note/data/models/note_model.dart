class NoteModel {
  final String title;
  final String note;
  final String date;
  final String startTime;
  final String endTime;
  final int remind;
  final String repeat;
  final int color;
  int? isCompleted;

  NoteModel({
    required this.title,
    required this.note,
    required this.date,
    required this.startTime,
    required this.endTime,
    required this.remind,
    required this.repeat,
    required this.color,
    this.isCompleted,
  });

  Map<String, dynamic> toJson() => {
        'title': title,
        'note': note,
        'date': date,
        'startTime': startTime,
        'endTime': endTime,
        'remind': remind,
        'repeat': repeat,
        'color': color,
        'isCompleted': isCompleted,
      };
}
