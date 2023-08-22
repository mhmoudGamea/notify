import 'package:dartz/dartz.dart';
import 'package:notify/core/utils/db_helper.dart';
import 'package:notify/features/new_note/data/models/note_model.dart';
import 'package:notify/features/new_note/data/repos/note_repo.dart';
import 'package:sqflite/sqflite.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/errors/success.dart';

class NoteRepoImpl extends NoteRepo {
  @override
  Future<Either<Failure, Success>> addNewNote(
      {required NoteModel noteModel}) async {
    try {
      final result = await DBHelper.insertDB(noteModel.toJson());
      if (result == 0) {
        // failure inserting
        return left(
            DataBaseFailure.fromAddingNote('Failed to adding this note'));
      }
      return right(
          DataBaseSuccess.fromAddingNote('Success to adding this note'));
    } on DatabaseException catch (error) {
      print('DBBBBB: $error');
      return left(DataBaseFailure.fromAddingNote(error.toString()));
    } catch (error) {
      print(error.toString());
      return left(
          DataBaseFailure.fromAddingNote('Error happen while adding note'));
    }
  }
}
