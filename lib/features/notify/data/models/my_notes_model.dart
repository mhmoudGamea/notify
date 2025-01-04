class MyNotesModel {
  final int id;
  final String title;
  final String note;
  final String date;
  final String startTime;
  final String endTime;
  final int color;
  int? isCompleted;

  MyNotesModel({
    required this.id,
    required this.title,
    required this.note,
    required this.date,
    required this.startTime,
    required this.endTime,
    required this.color,
    this.isCompleted,
  });
  factory MyNotesModel.fromJson(Map<String, dynamic> json) => MyNotesModel(
        id: json['id'],
        title: json['title'],
        note: json['note'],
        date: json['date'],
        startTime: json['startTime'],
        endTime: json['endTime'],
        color: json['color'],
        isCompleted: json['isCompleted'],
      );

  static List<MyNotesModel> myNotesModelList(
      List<Map<String, dynamic>> mapList) {
    final List<MyNotesModel> myList = [];
    for (var element in mapList) {
      myList.add(MyNotesModel.fromJson(element));
    }
    return myList;
  }
}
