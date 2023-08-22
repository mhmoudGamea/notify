part of 'notes_cubit.dart';

@immutable
sealed class NotesState {}

final class NotesInitial extends NotesState {}

final class NotesLoading extends NotesState {}

final class NotesSuccess extends NotesState {
  final List<MyNotesModel> myNotesList;
  NotesSuccess(this.myNotesList);
}

final class NotesFailure extends NotesState {
  final String error;
  NotesFailure(this.error);
}

final class NoteDeleteLoading extends NotesState {}

final class NoteDeleteSuccess extends NotesState {}

final class NoteDeleteFailure extends NotesState {}

final class NoteUpdateLoading extends NotesState {}

final class NoteUpdateSuccess extends NotesState {}

final class NoteUpdateFailure extends NotesState {}
