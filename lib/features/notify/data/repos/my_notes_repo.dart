import 'package:dartz/dartz.dart';
import 'package:notify/core/errors/failure.dart';
import 'package:notify/core/errors/success.dart';

import '../models/my_notes_model.dart';

abstract class MyNotesRepo {
  Future<Either<Failure, List<MyNotesModel>>> getAllNotes(String date);
  Future<Either<Failure, Success>> deleteNote(int id);
  Future<Either<Failure, Success>> updateNote(
      {required int id, required Map<String, dynamic> data});
}
