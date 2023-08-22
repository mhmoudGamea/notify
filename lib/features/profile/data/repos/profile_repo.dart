import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../../notify/data/models/my_notes_model.dart';

abstract class ProfileRepo {
  Future<Either<Failure, List<MyNotesModel>>> queryAll();
  // Future<Either<Failure, List<MyNotesModel>>>
  //     queryCompleted(); //[isCompleted = 1] [COMPLETED]
  // Future<Either<Failure, List<MyNotesModel>>>
  //     queryTodo(); //[isCompleted = 0] [TODO]

  // Future<Either<Failure, List<MyNotesModel>>> queryDelayed(
  //     {required String
  //         date}); //[it's deadline has gone and you didn't complete it]
}
