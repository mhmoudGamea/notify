abstract class Success {
  final String successMessage;
  const Success(this.successMessage);
}

class DataBaseSuccess extends Success {
  DataBaseSuccess(super.successMessage);

  factory DataBaseSuccess.fromAddingNote(String success) {
    return DataBaseSuccess(success);
  }
}
