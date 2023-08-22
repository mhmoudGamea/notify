import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:notify/core/utils/app_theme.dart';
import 'package:notify/features/new_note/data/models/note_model.dart';
import 'package:notify/features/new_note/data/repos/note_repo.dart';
import 'package:notify/features/notify/presentation/model_views/notes/notes_cubit.dart';

import '../../../../../core/utils/helper.dart';

part 'form_state.dart';

class FormCubit extends Cubit<FormState> {
  final NoteRepo _noteRepo;
  FormCubit(this._noteRepo) : super(FormInitial());
  //Title input field and it's controller
  final TextEditingController _titleController = TextEditingController();
  TextEditingController get getTitleController {
    return _titleController;
  }

  //Note input field and it's controller
  final TextEditingController _noteController = TextEditingController();
  TextEditingController get getNoteController {
    return _noteController;
  }

  //Date input field in form
  DateTime _currentDate = DateTime.now();

  DateTime get getCurrentDate {
    return _currentDate;
  }

  set setCurrentDate(DateTime dateTime) {
    _currentDate = dateTime;
    emit(CurrentDateInputChanged());
  }

  //Start time input field in form
  // String _startTime = DateFormat('hh: mm a').format(DateTime.now());

  TimeOfDay _startTime = TimeOfDay.fromDateTime(DateTime.now());

  TimeOfDay get getStartTime {
    return _startTime;
  }

  set setStartTime(TimeOfDay startTime) {
    _startTime = startTime;
    emit(StartTimeInputChanged());
  }

  //End time input field in form
  //endTime is dynamic it will be after startTime by half hour
  TimeOfDay _endTime =
      TimeOfDay.fromDateTime(DateTime.now().add(const Duration(minutes: 30)));

  TimeOfDay get getEndTime {
    return _endTime;
  }

  set setEndTime(TimeOfDay endTime) {
    _endTime = endTime;
    emit(StartTimeInputChanged());
  }

  //Remind dropDown section
  final List<int> _remind = [5, 10, 15, 20];

  var _selectedRemind = 5;

  int get getSelectedRemind {
    return _selectedRemind;
  }

  set setSelectedRemind(int value) {
    _selectedRemind = value;
    emit(RemindChanged());
  }

  List<DropdownMenuItem<int>> getRemindDropDownMenuItems() {
    return _remind
        .map((element) => DropdownMenuItem(
              value: element,
              child: Text(element.toString()),
            ))
        .toList();
  }

  //Remind dropDown section
  final List<String> _repeat = ['None', 'Daily', 'Weekly', 'Monthly'];

  var _selectedRepeat = 'None';

  String get getSelectedRepeat {
    return _selectedRepeat;
  }

  set setSelectedRepeat(String value) {
    _selectedRepeat = value;
    emit(RepeatChanged());
  }

  List<DropdownMenuItem<String>> getRepeatDropDownMenuItems() {
    return _repeat
        .map((element) => DropdownMenuItem(
              value: element,
              child: Text(element),
            ))
        .toList();
  }

  //Color section
  final List<Color> _notesColor = [
    AppTheme.darkBlue,
    AppTheme.darkGreen,
    AppTheme.darkPink,
    Colors.orange,
  ];
  List<Color> get getNotesColor {
    return _notesColor;
  }

  Color _selectedColor = AppTheme.darkBlue;

  Color get getSelectedColor {
    return _selectedColor;
  }

  set setSelectedColor(Color value) {
    _selectedColor = value;
    emit(ColorChanged());
  }

  //Validate function 'll be tregared when user hit add note button
  void validate(BuildContext context) async {
    if (getTitleController.text.isEmpty && getNoteController.text.isEmpty) {
      Helper.showCustomToast(
          context: context,
          bgColor: AppTheme.darkBlue,
          icon: Icons.warning_amber_rounded,
          msg: 'Title & note fields are required');
    } else if (getTitleController.text.isEmpty &&
        getNoteController.text.isNotEmpty) {
      Helper.showCustomToast(
          context: context,
          bgColor: AppTheme.darkBlue,
          icon: Icons.warning_amber_rounded,
          msg: 'Title field is required');
    } else if (getTitleController.text.isNotEmpty &&
        getNoteController.text.isEmpty) {
      Helper.showCustomToast(
          context: context,
          bgColor: AppTheme.darkBlue,
          icon: Icons.warning_amber_rounded,
          msg: 'Note field is required');
    } else {
      await submitTodb(context);
    }
  }

  Future<void> submitTodb(BuildContext context) async {
    String date = DateFormat.yMd().format(getCurrentDate);
    String startTime = getStartTime.format(context);
    String endTime = getEndTime.format(context);

    final response = await _noteRepo.addNewNote(
        noteModel: NoteModel(
      title: getTitleController.text,
      note: getNoteController.text,
      date: date,
      startTime: startTime,
      endTime: endTime,
      remind: getSelectedRemind,
      repeat: getSelectedRepeat,
      color: getSelectedColor.value,
      isCompleted: 0,
    ));

    response.fold((failure) {
      Helper.showCustomToast(
          context: context,
          bgColor: Colors.red,
          icon: Icons.dangerous,
          msg: failure.errMessage);
    }, (success) async {
      await BlocProvider.of<NotesCubit>(context)
          .getNotes(DateFormat.yMd().format(DateTime.now()));
      Helper.showCustomToast(
          context: context,
          bgColor: AppTheme.darkBlue,
          icon: Icons.done_rounded,
          msg: success.successMessage);
    });
    GoRouter.of(context).pop();
  }
}
