import 'dart:developer';

import 'package:dartz/dartz.dart';

import 'package:notify/core/errors/failure.dart';
import 'package:notify/core/errors/success.dart';
import 'package:notify/features/notify/data/models/my_notes_model.dart';

import '../../../../core/utils/db_helper.dart';
import 'my_notes_repo.dart';

class MyNotesRepoImpl extends MyNotesRepo {
  @override
  Future<Either<Failure, List<MyNotesModel>>> getAllNotes(String date) async {
    try {
      final result = await DBHelper.queryByDate(date);
      log('Success in MyNotesRepoImpl - getAllNotes method');
      return right(MyNotesModel.myNotesModelList(result));
    } catch (error) {
      log('Error in MyNotesRepoImpl - getAllNotes method${error.toString()}');
      return left(
          DataBaseFailure.fromAddingNote('Error happen while getting notes'));
    }
  }

  @override
  Future<Either<Failure, Success>> deleteNote(int id) async {
    try {
      final result = await DBHelper.deleteNote(id: id);
      if (result == 0) {
        return left(DataBaseFailure('Failed to delete this note'));
      }
      print('number of deleted notes = $result');
      return right(DataBaseSuccess('Note deleted successfully'));
    } catch (error) {
      return left(DataBaseFailure('Failed to delete this note'));
    }
  }

  @override
  Future<Either<Failure, Success>> updateNote(
      {required int id, required Map<String, dynamic> data}) async {
    try {
      final result = await DBHelper.updateNote(id: id, data: data);
      if (result == 0) {
        return left(DataBaseFailure('Failed to update this note'));
      }
      print('number of updated notes = $result');
      return right(DataBaseSuccess('Note updated successfully'));
    } catch (error) {
      return left(DataBaseFailure('Failed to update this note'));
    }
  }
}
