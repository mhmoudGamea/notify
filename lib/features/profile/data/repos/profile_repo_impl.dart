import 'package:dartz/dartz.dart';
import 'package:notify/core/errors/failure.dart';
import 'package:notify/core/utils/db_helper.dart';
import 'package:notify/features/notify/data/models/my_notes_model.dart';
import 'package:notify/features/profile/data/repos/profile_repo.dart';

class ProfileRepoImpl extends ProfileRepo {
  @override
  Future<Either<Failure, List<MyNotesModel>>> queryAll() async {
    try {
      final result = await DBHelper.queryAll();
      return right(MyNotesModel.myNotesModelList(result));
    } catch (error) {
      return left(DataBaseFailure.fromQueryNote('Can\'t get notes'));
    }
  }

  // @override
  // Future<Either<Failure, List<MyNotesModel>>> queryCompleted() async {
  //   try {
  //     // 1 means it's completed
  //     final result = await DBHelper.queryIsCompleted(1);
  //     return right(MyNotesModel.myNotesModelList(result));
  //   } catch (error) {
  //     return left(DataBaseFailure.fromQueryNote('Can\'t get completed notes'));
  //   }
  // }

  // @override
  // Future<Either<Failure, List<MyNotesModel>>> queryTodo() async {
  //   try {
  //     // 0 means it's not completed or Todo
  //     final result = await DBHelper.queryIsCompleted(0);
  //     return right(MyNotesModel.myNotesModelList(result));
  //   } catch (error) {
  //     return left(DataBaseFailure.fromQueryNote('Can\'t get todo notes'));
  //   }
  // }

  // @override
  // Future<Either<Failure, List<MyNotesModel>>> queryDelayed(
  //     {required String date}) async {
  //   try {
  //     final result = await DBHelper.queryDelayed(currentDate: date);
  //     return right(MyNotesModel.myNotesModelList(result));
  //   } catch (error) {
  //     return left(DataBaseFailure.fromQueryNote('Can\'t get delayed notes'));
  //   }
  // }
}
