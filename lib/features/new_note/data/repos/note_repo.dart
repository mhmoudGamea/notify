import 'package:dartz/dartz.dart';
import 'package:notify/features/new_note/data/models/note_model.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/errors/success.dart';

abstract class NoteRepo {
  Future<Either<Failure, Success>> addNewNote({required NoteModel noteModel});
}
