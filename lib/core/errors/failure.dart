abstract class Failure {
  final String errMessage;
  Failure(this.errMessage);
}

class DataBaseFailure extends Failure {
  DataBaseFailure(super.errMessage);

  factory DataBaseFailure.fromAddingNote(String error) {
    return DataBaseFailure(error);
  }
  factory DataBaseFailure.fromQueryNote(String error) {
    return DataBaseFailure(error);
  }
}
