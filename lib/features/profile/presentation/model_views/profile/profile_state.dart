part of 'profile_cubit.dart';

@immutable
sealed class ProfileState {}

final class ProfileInitial extends ProfileState {}

final class NotesLoading extends ProfileState {}

final class NotesFailure extends ProfileState {}

final class NotesSuccess extends ProfileState {}
