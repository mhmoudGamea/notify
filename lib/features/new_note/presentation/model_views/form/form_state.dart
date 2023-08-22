part of 'form_cubit.dart';

@immutable
sealed class FormState {}

final class FormInitial extends FormState {}

final class CurrentDateInputChanged extends FormState {}

final class StartTimeInputChanged extends FormState {}

final class EndTimeInputChanged extends FormState {}

final class RemindChanged extends FormState {}

final class RepeatChanged extends FormState {}

final class ColorChanged extends FormState {}
