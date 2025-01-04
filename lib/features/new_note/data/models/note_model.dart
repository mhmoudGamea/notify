class NoteModel {
  final String title;
  final String note;
  final String date;
  final String startTime;
  final String endTime;
  final int color;
  int? isCompleted;

  NoteModel({
    required this.title,
    required this.note,
    required this.date,
    required this.startTime,
    required this.endTime,
    required this.color,
    this.isCompleted,
  });

  Map<String, dynamic> toJson() => {
        'title': title,
        'note': note,
        'date': date,
        'startTime': startTime,
        'endTime': endTime,
        'color': color,
        'isCompleted': isCompleted,
      };
}
