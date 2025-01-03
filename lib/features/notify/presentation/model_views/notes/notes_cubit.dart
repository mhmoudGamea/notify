import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notify/features/notify/data/models/my_notes_model.dart';
import 'package:notify/features/notify/data/repos/my_notes_repo.dart';

part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  final MyNotesRepo _myNotesRepo;
  NotesCubit(this._myNotesRepo) : super(NotesInitial());

  Future<void> getNotes([String? date]) async {
    // emit(NotesLoading());
    // final response = await _myNotesRepo.getAllNotes(date);
    // response.fold((failure) {
    //   emit(NotesFailure(failure.errMessage));
    // }, (success) {
    //   emit(NotesSuccess(success));
    // });
  }

  Future<void> deleteNote({required int noteId}) async {
    emit(NoteDeleteLoading());
    final response = await _myNotesRepo.deleteNote(noteId);
    response.fold((failure) {
      emit(NoteDeleteFailure());
    }, (success) {
      emit(NoteDeleteSuccess());
    });
  }

  Future<void> updateNote(
      {required int noteId, required Map<String, dynamic> data}) async {
    emit(NoteUpdateLoading());
    final response = await _myNotesRepo.updateNote(id: noteId, data: data);
    response.fold((failure) {
      emit(NoteUpdateFailure());
    }, (success) {
      emit(NoteUpdateSuccess());
    });
  }
}
